defmodule CurrencyLayer do
  alias CurrencyLayer.Request
  alias CurrencyLayer.Request.Params

  @behaviour CurrencyWatch.RatesAPI
  @behaviour CurrencyWatch.CurrenciesAPI

  def fetch_live_rates() do
    params = %Params{}
    json = Request.fetch("live", params)
    {:ok, map} = Jason.decode(json)
    %{"success" => true, "timestamp" => _, "quotes" => quotes} = map
    CurrencyLayer.Rate.extract_rates(quotes)
  end

  def fetch_historical_rates(date) do
    params = %Params{date: date}
    json = Request.fetch("historical", params)
    {:ok, map} = Jason.decode(json)
    %{"success" => true, "timestamp" => timestamp, "quotes" => quotes} = map
    rates = Enum.into(quotes, %{}, fn({key, value}) ->
      key = String.slice(key, 3..5)

      value = cond do
        is_float(value) -> Float.round(value, 6)
        true -> value
      end

      {key, value}
    end)
    {:ok, timestamp, rates}
  end

  def fetch_currencies() do
    params = %Params{}
    json = Request.fetch("list", params)
    {:ok, map} = Jason.decode(json)
    %{"success" => true, "currencies" => currencies} = map
    currencies
  end
end
