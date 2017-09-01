defmodule CurrencyWatch.RatesAPI do
  @callback fetch_live_rates() :: [{String.t, float}]
end
