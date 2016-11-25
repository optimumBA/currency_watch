defmodule CurrencyWatch.Currency do
  use CurrencyWatch.Web, :model

  schema "currencies" do
    field :code, :string
    field :name, :string

    has_many :exchange_rates, CurrencyWatch.ExchangeRate
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(code name))
    |> validate_required([:code, :name])
    |> validate_length(:code, is: 3)
    |> validate_format(:code, ~r/^[A-Z]+$/)
    |> unique_constraint(:code)
  end
end
