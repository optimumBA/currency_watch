defmodule CurrencyWatch.CurrencyViewTest do
  use CurrencyWatchWeb.ConnCase, async: true

  alias CurrencyWatchWeb.CurrencyView
  alias CurrencyWatch.Currency

  test "returns flag url when set" do
    currency = %Currency{flag: "eu"}
    assert "http://localhost:4001/images/flags/eu.png" == CurrencyView.flag_url(currency)
  end

  test "returns nil when flag not set" do
    currency = %Currency{flag: nil}
    assert nil == CurrencyView.flag_url(currency)
  end
end
