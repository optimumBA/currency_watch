use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :currency_watch, CurrencyWatchWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :currency_watch, CurrencyWatch.Repo,
  username: "postgres",
  password: "postgres",
  database: "currency_watch_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :currency_watch, :currency_layer, access_key: "1234", http_client: CurrencyLayer.Test.HTTPClient
