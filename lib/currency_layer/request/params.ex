defmodule CurrencyLayer.Request.Params do
  @access_key Application.get_env(:currency_watch, :currency_layer)[:access_key]

  defstruct access_key: @access_key, date: nil

  def append_to_url(url, %__MODULE__{access_key: access_key, date: date}) do
    url <> "?access_key=#{access_key}&date=#{date}"
  end
end
