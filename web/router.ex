defmodule HelloPhoenixRest.Router do
  use HelloPhoenixRest.Web, :router

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

  scope "/", HelloPhoenixRest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  resource "/hello", HelloPhoenixRest.HelloResource
  resource "/hello/:message", HelloPhoenixRest.MessageResource

  forward "/api", HelloPhoenixRest.RestRouter

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenixRest do
  #   pipe_through :api
  # end
end
