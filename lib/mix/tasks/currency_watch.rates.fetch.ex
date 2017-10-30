defmodule Mix.Tasks.CurrencyWatch.Rates.Fetch do
  use Mix.Task

  import Mix.Ecto, only: [ensure_started: 2]

  alias CurrencyWatch.{LiveExchangeRatesService, WatcherService}

  @shortdoc "Fetches live rates"

  def run(_) do
    ensure_started(CurrencyWatch.Repo, [])
    {:ok, _started} = Application.ensure_all_started(:httpoison)

    LiveExchangeRatesService.fetch
    WatcherService.notify
  end
end
