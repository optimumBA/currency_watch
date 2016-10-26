defmodule CurrencyLayerTest do
  use ExUnit.Case, async: true

  test "fetches live rates" do
    assert {:ok, _, rates} = CurrencyLayer.fetch_live_rates()
    assert %{"EUR" => 0.917397, "USD" => 1} = rates
  end

  test "fetches historical rates" do
    assert {:ok, _, rates} = CurrencyLayer.fetch_historical_rates("2016-10-23")
    assert %{"EUR" => 0.9188, "USD" => 1} = rates
  end

  test "fetches currencies" do
    assert {:ok, currencies} = CurrencyLayer.fetch_currencies()
    assert %{"EUR" => "Euro", "USD" => "United States Dollar"} = currencies
  end
end
