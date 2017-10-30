defmodule CurrencyWatch.WatcherService do
  alias CurrencyWatch.{Currency, Repo, Watcher}
  alias Facebook.Responder

  def notify do
    currencies = Currency
    |> Currency.with_current_and_last_rate()
    |> Repo.all()

    Enum.map(currencies, fn(currency) ->
      unless is_nil(currency.current_rate) or is_nil(currency.last_rate) do
        watchers = Watcher
        |> Watcher.with_threshold_between_rates(currency.last_rate, currency.current_rate)
        |> Watcher.with_identity()
        |> Repo.all()

        Enum.map(watchers, fn(watcher) ->
          Responder.send_message(watcher.identity.token, "1 USD = #{currency.current_rate} #{currency.code}")
        end)
      end
    end)
  end
end
