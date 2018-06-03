defmodule AuthPlaygroundWeb.PageController do
  use AuthPlaygroundWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
