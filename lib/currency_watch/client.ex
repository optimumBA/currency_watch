defmodule CurrencyWatch.Client do
  alias CurrencyWatch.Client.HttpClient
  alias CurrencyWatch.{Request, Response}

  @type request :: Request.t
  @type config :: Keyword.t
  @type response :: Response.t

  @callback send(request) :: response

  @default_client HttpClient

  def send(request) do
    client = Application.get_env(:currency_watch, :client) || @default_client
    client.send(request)
  end
end
