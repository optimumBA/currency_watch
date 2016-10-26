Code.require_file "currency_layer/http_client.exs", __DIR__
ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(CurrencyWatch.Repo, :manual)
ExUnit.configure formatters: [JUnitFormatter, ExUnit.CLIFormatter]
