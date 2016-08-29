defmodule HelloPhoenixRest.MessageResource do
  use PhoenixRest.Resource

  def allowed_methods(conn, state) do
    {["GET", "HEAD", "OPTIONS", "POST"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"text/html", :to_html}], conn, state}
  end

  def to_html(%{params: params} = conn, state) do
    %{"message" => message} = params
    {"Hello #{message}!", conn, state}
  end

  def content_types_accepted(conn, state) do
    {[{"multipart/mixed", :from_multipart}], conn, state}
  end

  def from_multipart(%{params: %{"post" => "good"}} = conn, state) do
    {true, conn, state}
  end

  def from_multipart(%{params: %{"post" => "create"}} = conn, state) do
    {{true, "/hello/new"}, conn, state}
  end

  def from_multipart(%{params: %{"post" => "body"}} = conn, state) do
    conn = conn |> put_rest_body("Success")
    {true, conn, state}
  end

  def from_multipart(%{params: %{"post" => "bad"}} = conn, state) do
    {false, conn, state}
  end
end
