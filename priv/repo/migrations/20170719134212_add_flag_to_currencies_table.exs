defmodule CurrencyWatch.Repo.Migrations.AddFlagToCurrenciesTable do
  use Ecto.Migration

  def change do
    alter table(:currencies) do
      add :flag, :string
    end
  end
end
