defmodule CurrencyWatch.Identity do
  use CurrencyWatch.Web, :model

  alias CurrencyWatch.Repo

  schema "identities" do
    field :token, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:token])
    |> validate_required([:token])
    |> unique_constraint(:token)
  end

  def exists(token) do
    query = from(i in __MODULE__, select: 1, limit: 1, where: i.token == ^token)

    case Repo.all(query) do
      [1] -> true
      [] -> false
    end
  end
end
