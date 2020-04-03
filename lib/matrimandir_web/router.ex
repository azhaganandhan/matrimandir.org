defmodule MatrimandirWeb.Router do
  use MatrimandirWeb, :router

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

  scope "/", MatrimandirWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/open_design_call", PageController, :open_design_call
    get "/about", PageController, :about
    get "/gardens", PageController, :about
  end

  # Other scopes may use custom stacks.
  # scope "/api", MatrimandirWeb do
  #   pipe_through :api
  # end
end
