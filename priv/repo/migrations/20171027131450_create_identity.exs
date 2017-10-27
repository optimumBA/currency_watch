defmodule CurrencyWatch.Repo.Migrations.CreateIdentity do
  use Ecto.Migration

  def change do
    create table(:identities) do
      add :token, :string

      timestamps()
    end
    create unique_index(:identities, [:token])
  end
end
