defmodule CurrencyWatch.RatesAPIMock do
  @behaviour CurrencyWatch.RatesAPI

  def fetch_live_rates do
    send self(), :rates_api

    [
      {"BAM", 1.727203},
    ]
  end
end
