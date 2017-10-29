defmodule Mix.Tasks.CurrencyWatch.Rates.CleanupTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.ExchangeRate
  alias CurrencyWatch.Repo

  describe "run" do
    test "doesn't call currency API when no new currencies" do
      currency = insert_currency()

      timestamp = DateTime.to_unix(DateTime.utc_now)
      {:ok, datetime} = DateTime.from_unix(timestamp - 2 * 24 * 60 * 60 - 1)
      insert_exchange_rate(currency, %{value: 0.858946, inserted_at: datetime})

      {:ok, datetime} = DateTime.from_unix(timestamp - 2 * 24 * 60 * 60 + 1)
      new_exchange_rate = insert_exchange_rate(currency, %{value: 0.858946, inserted_at: datetime})

      Mix.Tasks.CurrencyWatch.Rates.Cleanup.run("")

      exchange_rates = Repo.all(ExchangeRate)
      exchange_rate = Enum.at(exchange_rates, 0)

      assert length(exchange_rates) == 1
      assert new_exchange_rate.id == exchange_rate.id
    end
  end
end
