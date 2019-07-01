defmodule Teacher.PageController do
  use Teacher.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, _params) do
    :timer.sleep(1_000) #create something

    conn
    |> put_flash(:info, "Your record was created")
    |> render("index.html")
  end

  def wildcard(conn, params) do
    path = Map.fetch!(params, "thing")

    conn
    |> put_flash(:info, "Caught this route - #{path}")
    |> render("index.html")
  end
end
