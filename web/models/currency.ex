defmodule CurrencyWatch.Currency do
  use CurrencyWatch.Web, :model

  alias CurrencyWatch.{Repo, Currency}

  schema "currencies" do
    field :code, :string
    field :name, :string
    field :flag, :string

    has_many :exchange_rates, CurrencyWatch.ExchangeRate
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(code name flag))
    |> validate_required([:code, :name])
    |> validate_length(:code, is: 3)
    |> validate_format(:code, ~r/^[A-Z]+$/)
    |> unique_constraint(:code)
    |> validate_length(:flag, is: 2)
    |> validate_format(:flag, ~r/^[a-z]+$/)
  end

  def exists(code) do
    query = from(c in Currency, select: 1, limit: 1, where: c.code == ^code)

    case Repo.all(query) do
      [1] -> true
      [] -> false
    end
  end
end
