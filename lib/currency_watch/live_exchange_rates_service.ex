defmodule CurrencyWatch.LiveExchangeRatesService do
  require Logger

  alias CurrencyWatch.{Repo, Currency, ExchangeRate}

  def fetch do
    case CurrencyLayer.fetch_live_rates do
      {:ok, _, rates} ->
        save_rates(rates)
      true ->
        Logger.error "Error while fetching rates"
    end
  end

  defp save_rates([], _) do end
  defp save_rates([head|tail], currencies \\ %{}) do
    [currency_code, rate_value] = head

    if currency = Repo.get_by(Currency, code: currency_code) do
      save_rate(currency, rate_value)
    else
      if Enum.empty?(currencies) do
        {:ok, currencies} = CurrencyLayer.fetch_currencies()
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

    save_rates(tail, currencies)
  end

  defp save_rate(currency, rate_value) do
    currency
    |> Ecto.build_assoc(:exchange_rates)
    |> ExchangeRate.changeset(%{value: rate_value})
    |> Repo.insert
  end
end
