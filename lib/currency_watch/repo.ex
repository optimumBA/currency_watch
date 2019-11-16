defmodule CurrencyWatch.Repo do
  use Ecto.Repo,
    otp_app: :currency_watch,
    adapter: Ecto.Adapters.Postgres
end
