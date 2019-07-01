defmodule Teacher.Router do
  use Teacher.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Teacher do
    pipe_through :browser # Use the default browser stack

#    get "/*thing", PageController, :wildcard

    get "/", PageController, :index
    post "/create", PageController, :create

    resources "/posts", PostController do
      resources "/comments", CommentController, only: [:create]
    end

    resources "/movies", MovieController, except: [:delete]

    get "/phoenix*thing", PageController, :wildcard
  end

  scope "/api", Teacher, as: :api do
    pipe_through :api

    scope "/v1", Api.V1, as: :v1 do
      resources "/posts", PostController, only: [:index, :show]
    end
  end
end
