defmodule Mix.Tasks.CurrencyWatch.Rates.Cleanup do
  use Mix.Task

  alias CurrencyWatch.{ExchangeRate, Repo}

  @shortdoc "Removes old rates"

  def run(_) do
    Mix.Task.run "app.start"

    Repo.delete_all(ExchangeRate.old(ExchangeRate))
  end
end
