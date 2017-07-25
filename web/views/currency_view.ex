defmodule CurrencyWatch.CurrencyView do
  use CurrencyWatch.Web, :view

  def render("index.json", %{currencies: currencies}) do
    render_many(currencies, __MODULE__, "currency.json")
  end

  def render("currency.json", %{currency: currency}) do
    %{
      id: currency.id,
      code: currency.code,
      name: currency.name,
    }
  end
end
