# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :currency_watch,
  ecto_repos: [CurrencyWatch.Repo]

# Configures the endpoint
config :currency_watch, CurrencyWatch.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/H1JhnBuuySo1ZtEgBamIu2FZwBgq4mn7bdszq9WhfRBwoi7bIEFSqoktpYpycgd",
  render_errors: [view: CurrencyWatch.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CurrencyWatch.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
if File.exists? "config/#{Mix.env}.secret.exs" do
  import_config "#{Mix.env}.secret.exs"
end
