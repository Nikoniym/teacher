defmodule Teacher.Api.V1.PostController do
  use Teacher.Web, :controller

  alias Teacher.Post

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.json", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render(conn, "show.json", post: post)
  end
end