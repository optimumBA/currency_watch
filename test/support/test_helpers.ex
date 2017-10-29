defmodule CurrencyWatch.TestHelpers do
  alias CurrencyWatch.Repo
  alias CurrencyWatch.Currency

  def insert_currency(attrs \\ %{}) do
    changes = Dict.merge(%{
      code: "#{random_currency_code()}",
      name: "Currency"
    }, attrs)

    %Currency{}
    |> Currency.changeset(changes)
    |> Repo.insert!()
  end

  def insert_exchange_rate(currency, attrs) do
    currency
    |> Ecto.build_assoc(:exchange_rates, attrs)
    |> Repo.insert!()
  end

  defp random_currency_code(code \\ "")
  defp random_currency_code(code) when byte_size(code) == 3, do: code
  defp random_currency_code(code), do: random_currency_code(code <> random_uppercase_letter())

  defp random_uppercase_letter do
    :crypto.rand_uniform(65, 90)
    |> <<>>
  end
end
