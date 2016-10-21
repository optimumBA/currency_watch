use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :currency_watch, CurrencyWatch.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :currency_watch, CurrencyWatch.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "currency_watch_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
