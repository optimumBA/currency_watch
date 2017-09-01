defmodule CurrencyLayer.RateTest do
  use ExUnit.Case, async: true
  alias CurrencyLayer.Rate

  test "extracts rates into list" do
    quotes = %{"USDUSD" => 1, "USDEUR" => 0.9188}
    assert [{"USD", 1}, {"EUR", 0.9188}] == Rate.extract_rates(quotes)
  end
end
