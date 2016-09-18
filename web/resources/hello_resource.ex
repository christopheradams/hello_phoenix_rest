defmodule HelloPhoenixRest.HelloResource do
  use PhoenixRest.Resource

  def allowed_methods(conn, state) do
    {["GET", "HEAD", "OPTIONS", "TRACE"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"text/html", :to_html}], conn, state}
  end

  def to_html(conn, state) do
    {"Hello world!", conn, state}
  end
end
