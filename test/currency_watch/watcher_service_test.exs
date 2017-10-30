defmodule CurrencyWatch.WatcherServiceTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.Client.InMemoryClient
  alias CurrencyWatch.{Identity, Request, Response, Watcher, WatcherService}

  describe "notify" do
    test "sends FB message only when threshold is between two last exchange rates" do
      currency = insert_currency(%{
        code: "BAM",
        name: "Bosnia-Herzegovina Convertible Mark"
      })

      changeset = Identity.changeset(%Identity{token: "1008372609250235"})
      {:ok, identity} = Repo.insert(changeset)
      %Watcher{}
      |> Watcher.changeset(%{identity_id: identity.id, currency_id: currency.id, threshold: 1.7})
      |> Repo.insert()

      insert_exchange_rate(currency, %{value: 1.699999})
      insert_exchange_rate(currency, %{value: 1.70101})

      response = %Response{status: :ok, body: %{
        "recipient_id" => "1008372609250235",
        "message_id" => "mid.1456970487936:c34767dfe57ee6e339",
      }}
      InMemoryClient.push(response)

      WatcherService.notify()

      assert %Request{
        body: %{
          recipient: %{
            id: "1008372609250235",
          },
          message: %{
            text: "1 USD = 1.701010 BAM",
          },
        },
      } = InMemoryClient.pop()

      insert_exchange_rate(currency, %{value: 1.71})
      insert_exchange_rate(currency, %{value: 1.68})

      InMemoryClient.push(response)

      WatcherService.notify()

      assert %Request{
        body: %{
          recipient: %{
            id: "1008372609250235",
          },
          message: %{
            text: "1 USD = 1.680000 BAM",
          },
        },
      } = InMemoryClient.pop()
    end
  end
end
