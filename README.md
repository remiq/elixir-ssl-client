ElixirSslClient
===============

Testing usage of HTTPoison with client SSL certificate for HTTPS requests.

Since this code shows how to use client, you will also need a server. Same configuration (ports, certificates) are also used here: https://github.com/remiq/nginx-ssl-client

To see how to use HTTPoison > Hackney > SSL options, check: test/elixir_ssl_client_test.exs

Caveats:
1. While cert paths can be supplied as "strings", password to keyfile needs to be supplied as 'char list'. Otherwise you will encounter cryptic error:
    
    {:error, %HTTPoison.Error{id: nil, reason: {:options, {:password, "your-password-here"}}}}




