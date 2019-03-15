defmodule Mix.Tasks.CurrencyWatch.Rates.Fetch do
  use Mix.Task

  @shortdoc "Fetches live rates"

  def run(_) do
    Mix.Task.run "app.start"

    CurrencyWatch.LiveExchangeRatesService.fetch
  end
end
