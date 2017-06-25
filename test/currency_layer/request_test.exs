defmodule CurrencyLayer.RequestTest do
  use ExUnit.Case, async: true

  alias CurrencyLayer.Request
  alias CurrencyLayer.Request.Params

  @live_url 'http://apilayer.net/api/live?access_key=1234&date='
  test "sets URL for live rates" do
    assert @live_url == Request.set_url("live", %Params{})
  end

  @historical_url 'http://apilayer.net/api/historical?access_key=1234&date=26-10-2016'
  test "sets URL for historical rates" do
    assert @historical_url == Request.set_url("historical", %Params{date: "26-10-2016"})
  end

  @list_url 'http://apilayer.net/api/list?access_key=1234&date='
  test "sets URL for currencies" do
    assert @list_url == Request.set_url("list", %Params{})
  end
end
