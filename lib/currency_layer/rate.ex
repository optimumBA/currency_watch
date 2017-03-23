defmodule CurrencyLayer.Rate do
  @enforce_keys [:currency, :value]
  defstruct [:currency, :value]

  def extract_rates(_, [], rates), do: rates
  def extract_rates(quotes, [head|tail], rates) do
    extract_rates(quotes, tail, [[String.slice(head, 3..5), quotes[head]]|rates])
  end
  def extract_rates(quotes), do: extract_rates(quotes, Map.keys(quotes), [])
end
