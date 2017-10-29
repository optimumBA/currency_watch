defmodule CurrencyWatch.Repo.Migrations.CreateWatcher do
  use Ecto.Migration

  def change do
    create table(:watchers) do
      add :threshold, :decimal
      add :identity_id, references(:identities, on_delete: :nothing)
      add :currency_id, references(:currencies, on_delete: :nothing)

      timestamps()
    end
    create index(:watchers, [:identity_id])
    create index(:watchers, [:currency_id])

  end
end
