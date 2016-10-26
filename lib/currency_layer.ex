defmodule CurrencyLayer do
  alias CurrencyLayer.Request

  def fetch_live_rates() do
    json = Request.fetch("live")
    {:ok, map} = JSON.decode(json)
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

  def fetch_historical_rates(date) do
    json = Request.fetch("historical", [date: date])
    {:ok, map} = JSON.decode(json)
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
    json = Request.fetch("list")
    {:ok, map} = JSON.decode(json)
    %{"success" => true, "currencies" => currencies} = map
    {:ok, currencies}
  end
end
