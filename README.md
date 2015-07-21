ElixirSslClient
===============

Testing usage of HTTPoison with client SSL certificate for HTTPS requests.

Since this code shows how to use client, you will also need a server. Same configuration (ports, certificates) are also used here: https://github.com/remiq/nginx-ssl-client

To see how to use HTTPoison > Hackney > SSL options, check: test/elixir_ssl_client_test.exs

    HTTPoison.get "https://localhost:8443/", [], [ # HTTPoison options
        hackney: [ # :hackney options
            ssl_options: [ # :ssl options
                cacertfile: "certs/ca.crt", # CA certificate used to validate server cert; path(), "string" is ok
                certfile: "certs/client.crt", # client certificate, signed by CA; path(), "string" is ok
                keyfile: "certs/client.key", # private key for client.crt; path(). "string" is ok
                password: 'test' # password for keyfile; string(), "string" not ok, use 'char list'
            ]
        ]
    ]

## Caveats

While cert paths can be supplied as "strings", password to keyfile needs to be supplied as 'char list'. Otherwise you will encounter cryptic error:
    
    {:error, %HTTPoison.Error{id: nil, reason: {:options, {:password, "your-password-here"}}}}




