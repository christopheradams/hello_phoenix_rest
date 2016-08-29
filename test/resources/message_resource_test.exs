defmodule HelloPhoenixRest.MessageResourceTest do
  use HelloPhoenixRest.ConnCase

  test "GET /hello/:message", %{conn: conn} do
    conn = get conn, "/hello/world"
    assert html_response(conn, 200) =~ "Hello world!"

    conn = get conn, "/hello/everyone"
    assert html_response(conn, 200) =~ "Hello everyone!"
  end

  test "Good POST /hello/:message", %{conn: conn} do
    conn = post conn, "/hello/world", %{"post" => "good"}
    assert response(conn, 204)
  end

  test "Create POST /hello/:message", %{conn: conn} do
    conn = post conn, "/hello/world", %{"post" => "create"}
    assert response(conn, 303)
  end

  test "Body POST /hello/:message", %{conn: conn} do
    conn = post conn, "/hello/world", %{"post" => "body"}
    assert html_response(conn, 200) =~ "Success"
  end

  test "Bad POST /hello/:message", %{conn: conn} do
    conn = post conn, "/hello/world", %{"post" => "bad"}
    assert response(conn, 400)
  end
end
