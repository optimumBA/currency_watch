defmodule CurrencyWatch.CurrenciesAPIMock do
  @behaviour CurrencyWatch.CurrenciesAPI

  def fetch_currencies do
    send self(), :currencies_api

    %{
      "BAM" => "Bosnia-Herzegovina Convertible Mark",
    }
  end
end
