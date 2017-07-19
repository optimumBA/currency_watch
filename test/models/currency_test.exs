defmodule CurrencyWatch.CurrencyTest do
  use CurrencyWatch.ModelCase, async: true

  alias CurrencyWatch.Currency

  @valid_attrs %{code: "USD", name: "United States Dollar", flag: "us"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Currency.changeset(%Currency{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Currency.changeset(%Currency{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not allow numbers in currency code" do
    attrs = Map.put(@valid_attrs, :code, "3UR")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:code, {"has invalid format", []}} in changeset.errors
  end

  test "changeset does not allow symbols in currency code" do
    attrs = Map.put(@valid_attrs, :code, "U$D")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:code, {"has invalid format", []}} in changeset.errors
  end

  test "changeset does not allow short currency code" do
    attrs = Map.put(@valid_attrs, :code, "US")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:code, {"should be %{count} character(s)", [count: 3]}} in changeset.errors
  end

  test "changeset does not allow long currency code" do
    attrs = Map.put(@valid_attrs, :code, "USSD")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:code, {"should be %{count} character(s)", [count: 3]}} in changeset.errors
  end

  test "changeset does not allow numbers in currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "3u")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:flag, {"has invalid format", []}} in changeset.errors
  end

  test "changeset does not allow symbols in currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "u$")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:flag, {"has invalid format", []}} in changeset.errors
  end

  test "changeset does not allow short currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "B")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:flag, {"should be %{count} character(s)", [count: 2]}} in changeset.errors
  end

  test "changeset does not allow long currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "bam")
    changeset = Currency.changeset(%Currency{}, attrs)
    refute changeset.valid?
    assert {:flag, {"should be %{count} character(s)", [count: 2]}} in changeset.errors
  end
end
