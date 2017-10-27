defmodule CurrencyWatch.IdentityRepoTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.Identity

  @valid_attrs %{token: "token"}

  test "converts unique_constraint on token to error" do
    %Identity{}
    |> Identity.changeset(@valid_attrs)
    |> Repo.insert!()

    changeset = Identity.changeset(%Identity{}, @valid_attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:token, {"has already been taken", []}} in changeset.errors
  end
end
