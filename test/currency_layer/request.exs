defmodule CurrencyLayer.RequestTest do
  use ExUnit.Case, async: true
  alias CurrencyLayer.Request

  @live_url "http://apilayer.com/api/live?access_key=1234"
  test "sets URL for live rates" do
    assert @live_url = Request.set_url("live", [])
  end

  @historical_url "http://apilayer.com/api/live?access_key=1234&date=26-10-2016"
  test "sets URL for historical rates" do
    assert @historical_url = CurrencyLayer.set_url("live", [date: "26-10-2016"])
  end

  @list_url "http://apilayer.com/api/list?access_key=1234"
  test "sets URL for currencies" do
    assert @live_url = Request.set_url("list", [])
  end
end
