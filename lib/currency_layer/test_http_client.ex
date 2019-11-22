defmodule CurrencyLayer.TestHttpClient do
  @historical_json File.read!("test/fixtures/currency_layer/historical.json")
  @list_json File.read!("test/fixtures/currency_layer/list.json")
  @live_json File.read!("test/fixtures/currency_layer/live.json")

  def request(url) do
    url = to_string(url)

    cond do
      String.contains?(url, "historical") -> {:ok, {[], [], @historical_json}}
      String.contains?(url, "list") -> {:ok, {[], [], @list_json}}
      String.contains?(url, "live") -> {:ok, {[], [], @live_json}}
      true -> {:ok, {[], [], "{}"}}
    end
  end
end
