defmodule HelloPhoenixRest.RestRouter do
  use PlugRest.Router
  use Plug.ErrorHandler

  plug :match
  plug :dispatch

  resource "/hello", HelloPhoenixRest.HelloResource

  match "/match" do
   send_resp(conn, 200, "Match!")
  end
end
