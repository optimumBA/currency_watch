# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :currency_watch,
  ecto_repos: [CurrencyWatch.Repo]

# Configures the endpoint
config :currency_watch, CurrencyWatchWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bthsz+22Z2vte6C5pbMzusAgqlge/zoTKXiv+/GYE4JYwSFpJPFT6WdN7EkuS9Rf",
  render_errors: [view: CurrencyWatchWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CurrencyWatch.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :currency_watch, CurrencyWatch.Scheduler,
  jobs: [
    "@hourly": {CurrencyWatch.LiveExchangeRatesService, :fetch, []},
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
