defmodule CurrencyWatch.ExchangeRate do
  use CurrencyWatch.Web, :model

  alias CurrencyWatch.ExchangeRate

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

  def for_date(date) do
    from e in ExchangeRate,
      select: %{
        id: max(e.id),
        currency_id: e.currency_id,
        value: e.value
      },
      where: fragment("DATE(?)", e.inserted_at) == type(^date, Ecto.Date),
      group_by: [e.currency_id, e.value]
  end
end
