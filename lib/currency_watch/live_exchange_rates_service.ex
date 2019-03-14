defmodule CurrencyWatch.LiveExchangeRatesService do
  require Logger

  alias CurrencyWatch.{Repo, Currency, ExchangeRate}

  def fetch(rates_api \\ CurrencyLayer, currencies_api \\ CurrencyLayer) do
    rates = rates_api.fetch_live_rates()
    save_rates(rates, %{}, currencies_api)
  end

  defp save_rates([], _, _) do end
  defp save_rates([head|tail], currencies, currencies_api) do
    [currency_code, rate_value] = head

    if currency = Repo.get_by(Currency, code: currency_code) do
      save_rate(currency, rate_value)
    else
      currencies = if Enum.empty?(currencies) do
        currencies_api.fetch_currencies
      else
        currencies
      end

      changeset = Currency.changeset(%Currency{}, %{
        code: currency_code,
        name: currencies[currency_code]
      })

      case Repo.insert(changeset) do
        {:ok, currency} ->
          save_rate(currency, rate_value)
        {:error, changeset} ->
          Logger.error "Error while inserting currency: #{inspect(changeset)}"
      end
    end

    save_rates(tail, currencies, currencies_api)
  end

  defp save_rate(currency, rate_value) do
    currency
    |> Ecto.build_assoc(:exchange_rates)
    |> ExchangeRate.changeset(%{value: rate_value})
    |> Repo.insert
  end
end
