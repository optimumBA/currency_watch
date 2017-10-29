defmodule CurrencyWatch.LiveExchangeRatesServiceTest do
  use CurrencyWatch.ModelCase

  alias CurrencyWatch.CurrenciesAPIMock
  alias CurrencyWatch.LiveExchangeRatesService
  alias CurrencyWatch.RatesAPIMock

  describe "fetch" do
    test "calls currency API to get currency names" do
      LiveExchangeRatesService.fetch(RatesAPIMock, CurrenciesAPIMock)

      assert_received :rates_api
      assert_received :currencies_api
    end

    test "doesn't call currency API when no new currencies" do
      insert_currency(%{
        code: "BAM",
        name: "Bosnia-Herzegovina Convertible Mark"
      })

      LiveExchangeRatesService.fetch(RatesAPIMock, CurrenciesAPIMock)

      assert_received :rates_api
      refute_received :currencies_api
    end
  end
end
