defmodule CurrencyLayer.Request do
  alias CurrencyLayer.Request.Params

  @http Application.get_env(:currency_watch, :currency_layer)[:http_client] || :httpc
  def fetch(endpoint, params \\ %Params{}) do
    url = set_url(endpoint, params)
    {:ok, {_, _, body}} = @http.request(url)
    body
  end

  def set_url(endpoint, params) do
    endpoint
    |> create_url()
    |> Params.append_to_url(params)
    |> to_charlist()
  end

  @protocol Application.get_env(:currency_watch, :currency_layer)[:protocol] || "http"
  defp create_url(endpoint), do: @protocol <> "://apilayer.net/api/" <> endpoint
end
