defmodule ElixirSslClientTest do
  use ExUnit.Case

  test "Test server is running" do
    assert HTTPoison.get "https://localhost:8443/" == {:error, %HTTPoison.Error{id: nil, reason: {:tls_alert, 'unknown ca'}}}
  end

  test "Ignoring server cert, accessing hackney conf" do
    {reply, _} = HTTPoison.get "https://localhost:8443/", [], [hackney: [:insecure]]
    assert reply == :ok
  end

  test "Using CA cert to validate server cert" do
    {reply, http} = HTTPoison.get "https://localhost:8443/", [], [hackney: [ssl_options: [cacertfile: "certs/ca.crt"]]]
    assert reply == :ok
    assert http.status_code == 400
  end

  test "Using client cert to connect" do
    {reply, http} = HTTPoison.get "https://localhost:8443/", [], [hackney: [ssl_options: [cacertfile: "certs/ca.crt", certfile: "certs/client.crt", keyfile: "certs/client.key", password: 'test']]]
    assert reply == :ok
    assert http.status_code == 404
  end

end
