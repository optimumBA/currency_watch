# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
use Mix.Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :currency_watch, CurrencyWatch.Repo,
  ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

if !System.get_env("HOST") && System.get_env("HEROKU_APP_NAME") do
  app_name = System.get_env("HEROKU_APP_NAME")
  System.put_env("HOST", "#{app_name}.herokuapp.com")
end

host =
  System.get_env("HOST") ||
    raise """
    environment variable HOST is missing.
    For example: example.com
    """

config :currency_watch, CurrencyWatchWeb.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: host, port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: secret_key_base

currency_layer_key =
  System.get_env("CURRENCY_LAYER_KEY") ||
    raise """
    Environment variable CURRENCY_LAYER_KEY is missing.
    For example: 5f248b2z006d88a1b12342e75kc6a4c2
    """

config :currency_watch, :currency_layer,
  access_key: currency_layer_key
