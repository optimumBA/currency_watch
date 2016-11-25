defmodule CurrencyWatch.Repo.Migrations.CreateExchangeRate do
  use Ecto.Migration

  def change do
    create table(:exchange_rates) do
      add :value, :decimal, precision: 30, scale: 6
      add :currency_id, references(:currencies, on_delete: :nothing)

      timestamps()
    end
    create index(:exchange_rates, [:currency_id])

  end
end
