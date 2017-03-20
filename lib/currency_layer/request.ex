defmodule CurrencyLayer.Request do
  @http Application.get_env(:currency_watch, :currency_layer)[:http_client] || :httpc
  def fetch(endpoint, params \\ []) do
    url = set_url(endpoint, params)
    {:ok, {_, _, body}} = @http.request(url)
    body
  end

  def set_url(endpoint, params) do
    endpoint
    |> create_url()
    |> add_access_key()
    |> add_params(params)
    |> to_charlist()
  end

  @protocol Application.get_env(:currency_watch, :currency_layer)[:protocol] || "http"
  defp create_url(endpoint), do: @protocol <> "://apilayer.net/api/" <> endpoint

  @access_key Application.get_env(:currency_watch, :currency_layer)[:access_key]
  defp add_access_key(url), do: url <> "?access_key=#{@access_key}"

  defp add_params(url, []), do: url
  defp add_params(url, [{key, value}|tail]) do
    add_params(url <> "&#{key}=#{value}", tail)
  end
end
