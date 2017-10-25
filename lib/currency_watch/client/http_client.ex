defmodule CurrencyWatch.Client.HttpClient do
  alias CurrencyWatch.{Request, Response}

  @behaviour CurrencyWatch.Client

  def send(request) do
    request
    |> add_params()
    |> encode_body()
    |> execute_request()
    |> process_response()
    |> format_response()
  end

  defp add_params(request) do
    Map.put(request, :endpoint, request.endpoint <> "?" <> URI.encode_query(request.params))
  end

  def encode_body(%Request{body: ""} = request), do: request
  def encode_body(%Request{body: body} = request) do
    {:ok, body} = Poison.encode(body)
    Map.put(request, :body, body)
  end

  defp execute_request(request) do
    HTTPoison.request(request.method, request.endpoint, request.body, request.headers)
  end

  defp process_response({:ok, %{status_code: 200, body: body}} = _response) do
    decode_response(body)
  end
  defp process_response({:ok, %{status_code: 404}} = _response), do: {:error, "INVALID_ENDPOINT"}
  defp process_response({:error, reason}), do: {:error, reason}

  defp decode_response(body) do
    case Poison.decode(body) do
      {:ok, data} -> {:ok, data}
      _ -> {:error, "can't decode response body"}
    end
  end

  defp format_response({:ok, body}), do: %Response{status: :ok, body: body}
  defp format_response({:error, reason}), do: %Response{status: :error, body: reason}
end
