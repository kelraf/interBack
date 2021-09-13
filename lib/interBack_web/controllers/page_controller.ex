defmodule InterBackWeb.PageController do
  use InterBackWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
