defmodule CurrencyWatchWeb.CurrencyController do
  use CurrencyWatchWeb, :controller

  alias CurrencyWatch.Currency

  def index(conn, _params) do
    currencies = Currency
    |> Currency.with_current_and_last_rate
    |> Repo.all

    render(conn, "index.json", currencies: currencies)
  end
end
