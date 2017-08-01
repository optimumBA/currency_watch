defmodule Mix.Tasks.CurrencyWatch.Rates.Cleanup do
  use Mix.Task

  import Mix.Ecto, only: [ensure_started: 2]

  alias CurrencyWatch.{ExchangeRate, Repo}

  @shortdoc "Removes old rates"

  def run(_) do
    ensure_started(Repo, [])

    Repo.delete_all(ExchangeRate.old(ExchangeRate))
  end
end
