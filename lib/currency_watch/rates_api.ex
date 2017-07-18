defmodule CurrencyWatch.RatesAPI do
  @callback fetch_live_rates() :: []
end
