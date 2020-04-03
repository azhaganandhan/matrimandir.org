defmodule MatrimandirWeb.PageController do
  use MatrimandirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def open_design_call(conn, _params) do
    render(conn, "design_call.html")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def gardens(conn, _params) do
    render(conn, "gardens.html")
  end

  def gallery(conn, _params) do
    render(conn, "gallery.html")
  end
end
