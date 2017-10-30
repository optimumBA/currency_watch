defmodule CurrencyWatch.Watcher do
  use CurrencyWatch.Web, :model

  schema "watchers" do
    field :threshold, :decimal
    belongs_to :identity, CurrencyWatch.Identity
    belongs_to :currency, CurrencyWatch.Currency

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:identity_id, :currency_id, :threshold])
    |> validate_required([:threshold])
    |> validate_number(:threshold, greater_than: Decimal.new(0))
  end

  def with_threshold_between_rates(query, last_rate, current_rate) do
    from w in query,
      where: w.threshold >= ^last_rate and w.threshold <= ^current_rate or w.threshold >= ^current_rate and w.threshold <= ^last_rate
  end

  def with_identity(query \\ __MODULE__) do
    from c in query,
      preload: [:identity]
  end
end
