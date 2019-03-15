defmodule CurrencyWatch.ExchangeRate do
  use CurrencyWatchWeb, :model

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
        id: e.id,
        currency_id: e.currency_id,
        value: e.value
      },
      distinct: e.currency_id,
      where: fragment("DATE(?)", e.inserted_at) == ^NaiveDateTime.to_date(date),
      order_by: [desc: e.inserted_at, desc: e.id]
  end

  def old(query) do
    timestamp = DateTime.to_unix(DateTime.utc_now)
    {:ok, datetime} = DateTime.from_unix(timestamp - 2 * 24 * 60 * 60)

    from e in query,
      where: e.inserted_at < ^datetime
  end
end
