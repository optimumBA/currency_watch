defmodule Facebook.MessageProcessorTest do
  use CurrencyWatch.ModelCase

  alias Facebook.MessageProcessor

  test "responds to 💩 with 🙈" do
    assert MessageProcessor.create_response("💩") == "🙈"
  end

  test "responds to unrecognized commands" do
    assert MessageProcessor.create_response("!") == "Unrecognized command"
  end

  test "returns current exchange rate when currency is found" do
    currency = insert_currency(%{
      code: "BAM",
      name: "Bosnia-Herzegovina Convertible Mark"
    })
    insert_exchange_rate(currency, %{value: 1.668101})
    timestamp = DateTime.to_unix(DateTime.utc_now)
    {:ok, datetime} = DateTime.from_unix(timestamp - 60 * 60)
    insert_exchange_rate(currency, %{value: 1.668, inserted_at: datetime})

    insert_currency(%{
      code: "EUR",
      name: "Euro"
    })
    |> insert_exchange_rate(%{value: 0.851197})

    assert MessageProcessor.create_response("BAM") == "1 USD = 1.668101 BAM"
  end

  test "returns error message when currency doesn't exist" do
    assert MessageProcessor.create_response("ABC") == "Currency doesn't exist"
  end

  test "converts BAM to EUR" do
    insert_currency(%{
      code: "BAM",
      name: "Bosnia-Herzegovina Convertible Mark"
    })
    |> insert_exchange_rate(%{value: 1.67096})

    insert_currency(%{
      code: "EUR",
      name: "Euro"
    })
    |> insert_exchange_rate(%{value: 0.854359})

    assert MessageProcessor.create_response("10 EUR = ? BAM") == "10 EUR = 19.558055 BAM"
  end

  test "returns error message when currencies don't exist" do
    assert MessageProcessor.create_response("20 PNG = ? JPG") == "Unexisting currency/ies"
  end
end
