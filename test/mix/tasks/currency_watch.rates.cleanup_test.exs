defmodule Mix.Tasks.CurrencyWatch.Rates.CleanupTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.ExchangeRate
  alias CurrencyWatch.Repo

  describe "run" do
    test "doesn't call currency API when no new currencies" do
      currency = insert_currency()
      timestamp = DateTime.to_unix(DateTime.utc_now)
      unix_start = ~N[1970-01-01 00:00:00]
      two_days_before = timestamp - 2 * 24 * 60 * 60

      datetime = NaiveDateTime.add(unix_start, two_days_before - 1)
      currency
      |> Ecto.build_assoc(:exchange_rates, value: 0.858946, inserted_at: datetime)
      |> Repo.insert

      datetime = NaiveDateTime.add(unix_start, two_days_before + 1)
      {:ok, new_exchange_rate} = currency
      |> Ecto.build_assoc(:exchange_rates, value: 0.858946, inserted_at: datetime)
      |> Repo.insert

      Mix.Tasks.CurrencyWatch.Rates.Cleanup.run("")

      exchange_rates = Repo.all(ExchangeRate)
      exchange_rate = Enum.at(exchange_rates, 0)

      assert length(exchange_rates) == 1
      assert new_exchange_rate.id == exchange_rate.id
    end
  end
end
