defmodule CurrencyWatch.CurrencyController do
  use CurrencyWatch.Web, :controller

  alias CurrencyWatch.Currency

  def index(conn, _params) do
    currencies = Repo.all(Currency)
    render(conn, "index.json", currencies: currencies)
  end
end
