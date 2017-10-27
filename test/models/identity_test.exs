defmodule CurrencyWatch.IdentityTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.Identity

  @valid_attrs %{token: "token"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Identity.changeset(%Identity{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Identity.changeset(%Identity{}, @invalid_attrs)
    refute changeset.valid?
  end
end
