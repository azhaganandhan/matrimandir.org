defmodule MatrimandirWeb.PageController do
  use MatrimandirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
