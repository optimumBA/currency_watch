defmodule Facebook.MessageProcessor do
  alias CurrencyWatch.{Currency, Repo}

  def create_response("💩"), do: "🙈"
  def create_response(currency_code) when byte_size(currency_code) == 3 do
    if currency = Repo.get_by(Currency.with_current_and_last_rate(), code: currency_code) do
      "1 USD = #{currency.current_rate} #{currency.code}"
    else
      "Currency doesn't exist"
    end
  end
  def create_response(_), do: "Unrecognized command"
end
