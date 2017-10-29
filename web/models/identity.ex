defmodule CurrencyWatch.Identity do
  use CurrencyWatch.Web, :model

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
end
