ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(CurrencyWatch.Repo, :manual)
ExUnit.configure formatters: [JUnitFormatter, ExUnit.CLIFormatter]
