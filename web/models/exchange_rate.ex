defmodule CurrencyWatch.ExchangeRate do
  use CurrencyWatch.Web, :model

  schema "exchange_rates" do
    field :value, :decimal
    belongs_to :currency, CurrencyWatch.Currency

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:value])
    |> validate_required([:value])
  end
end
