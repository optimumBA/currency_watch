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

  def current do
    max_subquery = from e in __MODULE__,
      select: %{
        currency_id: e.currency_id,
        max_inserted_at: fragment("max(?)", e.inserted_at)
      },
      group_by: e.currency_id

    from e in __MODULE__,
      select: %{
        id: e.id,
        currency_id: e.currency_id,
        value: e.value
      },
      distinct: e.currency_id,
      join: erc in subquery(max_subquery), on: [currency_id: e.currency_id],
      where: e.inserted_at == erc.max_inserted_at,
      order_by: [desc: e.inserted_at]
  end

  def last do
    max_subquery = from e in __MODULE__,
      select: %{
        currency_id: e.currency_id,
        max_inserted_at: fragment("max(?)", e.inserted_at)
      },
      group_by: e.currency_id

    submax_subquery = from e in __MODULE__,
      select: %{
        currency_id: e.currency_id,
        max_inserted_at: fragment("max(?)", e.inserted_at)
      },
      join: erm in subquery(max_subquery), on: [currency_id: e.currency_id],
      where: e.inserted_at < erm.max_inserted_at,
      group_by: e.currency_id

    from e in __MODULE__,
      select: %{
        id: e.id,
        currency_id: e.currency_id,
        value: e.value
      },
      distinct: e.currency_id,
      join: erc in subquery(submax_subquery), on: [currency_id: e.currency_id],
      where: e.inserted_at == erc.max_inserted_at,
      order_by: [desc: e.inserted_at]
  end

  def old(query) do
    timestamp = DateTime.to_unix(DateTime.utc_now)
    {:ok, datetime} = DateTime.from_unix(timestamp - 2 * 24 * 60 * 60)

    from e in query,
      where: e.inserted_at < ^datetime
  end
end
