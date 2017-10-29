defmodule Facebook.MessageProcessorTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.{Identity, Watcher}
  alias Facebook.MessageProcessor

  test "responds to 💩 with 🙈" do
    assert MessageProcessor.create_response(%Identity{}, "💩") == "🙈"
  end

  test "responds to unrecognized commands" do
    assert MessageProcessor.create_response(%Identity{}, "!") == "Unrecognized command"
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

    assert MessageProcessor.create_response(%Identity{}, "BAM") == "1 USD = 1.668101 BAM"
  end

  test "returns error message when currency doesn't exist" do
    assert MessageProcessor.create_response(%Identity{}, "ABC") == "Currency doesn't exist"
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

    assert MessageProcessor.create_response(%Identity{}, "10 EUR = ? BAM") == "10 EUR = 19.558055 BAM"
  end

  test "returns error message when currencies don't exist" do
    assert MessageProcessor.create_response(%Identity{}, "20 PNG = ? JPG") == "Unexisting currency/ies"
  end

  test "creates watcher" do
    currency = insert_currency(%{
      code: "BAM",
      name: "Bosnia-Herzegovina Convertible Mark"
    })
    currency_id = currency.id
    identity = %Identity{}
    |> Identity.changeset(%{token: "12345"})
    |> Repo.insert!()
    identity_id = identity.id
    threshold = Decimal.new(1.85)

    assert Repo.all(Watcher) == []
    assert MessageProcessor.create_response(identity, "Watch BAM 1.85") == "Noted"
    assert [%Watcher{
      identity_id: ^identity_id,
      currency_id: ^currency_id,
      threshold: ^threshold,
    }] = Repo.all(Watcher)
  end

  test "when trying to watch it returns error message if currencies don't exist" do
    assert MessageProcessor.create_response(%Identity{}, "Watch PNG 21") == "Currency doesn't exist"
  end
end
