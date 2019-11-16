defmodule CurrencyWatch.ExchangeRateTest do
  use CurrencyWatch.DataCase

  alias CurrencyWatch.ExchangeRate

  @valid_attrs %{value: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = ExchangeRate.changeset(%ExchangeRate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = ExchangeRate.changeset(%ExchangeRate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
