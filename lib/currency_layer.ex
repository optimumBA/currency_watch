defmodule CurrencyLayer do
  def fetch_live_rates() do
    json = fetch_json("live")
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
    json = fetch_json("historical", [date: date])
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
    json = fetch_json("list")
    {:ok, map} = JSON.decode(json)
    %{"success" => true, "currencies" => currencies} = map
    {:ok, currencies}
  end

  @http Application.get_env(:currency_watch, :currency_layer)[:http_client] || :httpc
  defp fetch_json(endpoint, params \\ []) do
    url = endpoint
    |> create_url()
    |> add_access_key()
    |> add_params(params)
    |> String.to_char_list()

    {:ok, {_, _, body}} = @http.request(url)
    body
  end

  @protocol Application.get_env(:currency_watch, :currency_layer)[:protocol] || "http"
  defp create_url(endpoint), do: @protocol <> "://www.apilayer.net/api/" <> endpoint

  @access_key Application.get_env(:currency_watch, :currency_layer)[:access_key]
  defp add_access_key(url), do: url <> "?access_key=#{@access_key}"

  defp add_params(url, []), do: url
  defp add_params(url, [{key, value}|tail]) do
    add_params(url <> "&#{key}=#{value}", tail)
  end
end
