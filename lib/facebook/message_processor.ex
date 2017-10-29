defmodule Facebook.MessageProcessor do
  alias CurrencyWatch.{Currency, Repo, Watcher}

  def create_response(_, "💩"), do: "🙈"
  def create_response(_, currency_code) when byte_size(currency_code) == 3 do
    if currency = Repo.get_by(Currency.with_current_and_last_rate(), code: currency_code) do
      "1 USD = #{currency.current_rate} #{currency.code}"
    else
      "Currency doesn't exist"
    end
  end
  def create_response(identity, message) do
    if String.match?(message, ~r/^watch/i) do
      watch(identity, message)
    else
      calculate(message)
    end
  end

  defp calculate(message) do
    case Regex.named_captures(~r/^(?<quantity>[\d\.]+) (?<base_currency_code>[A-Z]{3}) = \? (?<calculation_currency_code>[A-Z]{3})$/, message) do
      %{"quantity" => quantity, "base_currency_code" => base_currency_code, "calculation_currency_code" => calculation_currency_code} ->
        if (base_currency = Repo.get_by(Currency.with_current_and_last_rate(), code: base_currency_code)) && (calculation_currency = Repo.get_by(Currency.with_current_and_last_rate(), code: calculation_currency_code)) do
          result = Decimal.new(quantity)
          |> Decimal.mult(calculation_currency.current_rate)
          |> Decimal.div(base_currency.current_rate)
          |> Decimal.round(6)

          "#{quantity} #{base_currency_code} = #{result} #{calculation_currency_code}"
        else
          "Unexisting currency/ies"
        end
      _ ->
        "Unrecognized command"
    end
  end

  def watch(identity, message) do
    case Regex.named_captures(~r/^watch (?<currency_code>[A-Z]{3}) (?<threshold>[\d\.]+)$/i, message) do
      %{"currency_code" => currency_code, "threshold" => threshold} ->
        if currency = Repo.get_by(Currency, code: currency_code) do
          %Watcher{}
          |> Watcher.changeset(%{identity_id: identity.id, currency_id: currency.id, threshold: threshold})
          |> Repo.insert()

          "Noted"
        else
          "Currency doesn't exist"
        end
      _ ->
        "Unrecognized command"
    end
  end
end
