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
  def create_response(message) do
    case Regex.named_captures(~r/^(?<quantity>[\d\.]+) (?<currency_code>[A-Z]{3}) = \? (?<currency_code2>[A-Z]{3})$/, message) do
      %{"quantity" => quantity, "currency_code" => currency_code, "currency_code2" => currency_code2} ->
        if (currency1 = Repo.get_by(Currency.with_current_and_last_rate(), code: currency_code)) && (currency2 = Repo.get_by(Currency.with_current_and_last_rate(), code: currency_code2)) do
          result = Decimal.new(quantity)
          |> Decimal.mult(currency2.current_rate)
          |> Decimal.div(currency1.current_rate)
          |> Decimal.round(6)

          "#{quantity} #{currency_code} = #{result} #{currency_code2}"
        else
          "Unexisting currency/ies"
        end
      _ ->
        "Unrecognized command"
    end
  end
end
