defmodule Mix.Tasks.CurrencyWatch.Rates.Fetch do
  use Mix.Task

  import Mix.Ecto, only: [ensure_started: 2]

  @shortdoc "Fetches live rates"

  def run(_) do
    ensure_started(CurrencyWatch.Repo, [])

    CurrencyWatch.LiveExchangeRatesService.fetch
  end
end
