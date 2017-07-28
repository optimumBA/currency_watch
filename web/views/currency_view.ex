defmodule CurrencyWatch.CurrencyView do
  use CurrencyWatch.Web, :view
  import CurrencyWatch.Router.Helpers, [:static_url]

  def render("index.json", %{currencies: currencies}) do
    render_many(currencies, __MODULE__, "currency.json")
  end

  def render("currency.json", %{currency: currency}) do
    %{
      id: currency.id,
      code: currency.code,
      name: currency.name,
      current_rate: currency.current_rate,
      last_rate: currency.last_rate,
      flag_url: flag_url(currency),
    }
  end

  def flag_url(currency) do
    static_url(CurrencyWatch.Endpoint, "/images/flags/#{currency.flag}.png")
  end
end
