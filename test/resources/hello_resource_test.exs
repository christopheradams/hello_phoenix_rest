defmodule HelloPhoenixRest.HelloResourceTest do
  use HelloPhoenixRest.ConnCase

  test "GET /api/hello", %{conn: conn} do
    conn = get conn, "/api/hello"
    assert html_response(conn, 200) =~ "Hello world!"
  end

  test "GET /hello", %{conn: conn} do
    conn = get conn, "/hello"
    assert html_response(conn, 200) =~ "Hello world!"
  end

  test "OPTIONS /hello", %{conn: conn} do
    conn = options conn, "/hello"
    assert response(conn, 200)
    assert (Plug.Conn.get_resp_header(conn, "allow")) == ["GET, HEAD, OPTIONS, TRACE"]
  end

  test "TRACE /hello", %{conn: conn} do
    conn = trace conn, "/hello"
    assert response(conn, 200)
  end
end
