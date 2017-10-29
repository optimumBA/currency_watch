defmodule CurrencyWatch.WatcherTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.Watcher

  @valid_attrs %{threshold: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Watcher.changeset(%Watcher{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Watcher.changeset(%Watcher{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not allow letters in threshold" do
    attrs = Map.put(@valid_attrs, :threshold, "USD")
    assert {:threshold, "is invalid"} in errors_on(%Watcher{}, attrs)
  end

  test "changeset does not allow symbols in threshold" do
    attrs = Map.put(@valid_attrs, :threshold, "$")
    assert {:threshold, "is invalid"} in errors_on(%Watcher{}, attrs)
  end
end
