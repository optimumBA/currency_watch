defmodule CurrencyWatch.CurrencyRepoTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.Currency

  @valid_attrs %{code: "USD", name: "United States Dollar"}

  test "converts unique_constraint on code to error" do
    insert_currency(@valid_attrs)
    attrs = Map.put(@valid_attrs, :code, "USD")
    changeset = Currency.changeset(%Currency{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:code, {"has already been taken", [constraint: :unique, constraint_name: "currencies_code_index"]}} in changeset.errors
  end
end
