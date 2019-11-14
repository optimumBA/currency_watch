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

host =
  System.get_env("HOST") ||
    raise """
    environment variable HOST is missing.
    For example: cw-s-eu-4692.herokuapp.com
    """

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :currency_watch, CurrencyWatchWeb.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "4000")],
  https: [:inet6, port: 443]
  url: [host: host, port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  secret_key_base: secret_key_base

# ## Using releases (Elixir v1.9+)
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start each relevant endpoint:
#
#     config :currency_watch, CurrencyWatchWeb.Endpoint, server: true
#
# Then you can assemble a release by calling `mix release`.
# See `mix help release` for more information.

currency_layer_key =
  System.get_env("CURRENCY_LAYER_KEY") ||
    raise """
    Environment variable CURRENCY_LAYER_KEY is missing.
    For example: 5f248b2z006d88a1b12342e75kc6a4c2
    """

config :currency_watch, :currency_layer,
  access_key: currency_layer_key
