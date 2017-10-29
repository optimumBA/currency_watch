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
end
