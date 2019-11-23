defmodule CurrencyLayer.Request.Params do
  defstruct [:access_key, :date]

  def append_to_url(url, params = %__MODULE{access_key: nil}) do
    access_key = Application.get_env(:currency_watch, :currency_layer)[:access_key]
    params = Map.put(params, :access_key, access_key)
    append_to_url(url, params)
  end
  def append_to_url(url, %__MODULE__{access_key: access_key, date: date}) do
    url <> "?access_key=#{access_key}&date=#{date}"
  end
end
