defmodule HelloPhoenixRest.PageController do
  use HelloPhoenixRest.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
