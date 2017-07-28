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
    assert {:code, "has invalid format"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow symbols in currency code" do
    attrs = Map.put(@valid_attrs, :code, "U$D")
    assert {:code, "has invalid format"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow short currency code" do
    attrs = Map.put(@valid_attrs, :code, "US")
    assert {:code, "should be 3 character(s)"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow long currency code" do
    attrs = Map.put(@valid_attrs, :code, "USSD")
    assert {:code, "should be 3 character(s)"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow numbers in currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "3u")
    assert {:flag, "has invalid format"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow symbols in currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "u$")
    assert {:flag, "has invalid format"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow short currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "B")
    assert {:flag, "should be 2 character(s)"} in errors_on(%Currency{}, attrs)
  end

  test "changeset does not allow long currency flag" do
    attrs = Map.put(@valid_attrs, :flag, "bam")
    assert {:flag, "should be 2 character(s)"} in errors_on(%Currency{}, attrs)
  end
end
