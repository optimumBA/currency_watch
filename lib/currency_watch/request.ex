defmodule CurrencyWatch.Request do
  defstruct [:method, :endpoint, :body, :params, :headers]

  def new(method, endpoint, body \\ "", params \\ %{}, headers \\ []) do
    %__MODULE__{method: method, endpoint: endpoint, body: body, params: params, headers: headers}
  end
end
