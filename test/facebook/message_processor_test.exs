defmodule Facebook.MessageProcessorTest do
  use CurrencyWatch.ModelCase

  alias Facebook.MessageProcessor
  alias CurrencyWatch.{Currency, ExchangeRate, Repo}

  test "responds to 💩 with 🙈" do
    assert MessageProcessor.create_response("💩") == "🙈"
  end

  test "responds to unrecognized commands" do
    assert MessageProcessor.create_response("!") == "Unrecognized command"
  end

  test "returns current exchange rate when currency is found" do
    changeset = Currency.changeset(%Currency{}, %{
      code: "BAM",
      name: "Bosnia-Herzegovina Convertible Mark"
    })
    {:ok, currency} = Repo.insert(changeset)
    currency
    |> Ecto.build_assoc(:exchange_rates, value: 1.668101)
    |> Repo.insert
    timestamp = DateTime.to_unix(DateTime.utc_now)
    {:ok, datetime} = DateTime.from_unix(timestamp - 60 * 60)
    currency
    |> Ecto.build_assoc(:exchange_rates, value: 1.668, inserted_at: datetime)
    |> Repo.insert

    changeset = Currency.changeset(%Currency{}, %{
      code: "EUR",
      name: "Euro"
    })
    {:ok, currency} = Repo.insert(changeset)
    currency
    |> Ecto.build_assoc(:exchange_rates, value: 0.851197)
    |> Repo.insert

    assert MessageProcessor.create_response("BAM") == "1 USD = 1.668101 BAM"
  end

  test "returns error message when currency doesn't exist" do
    assert MessageProcessor.create_response("ABC") == "Currency doesn't exist"
  end
end
