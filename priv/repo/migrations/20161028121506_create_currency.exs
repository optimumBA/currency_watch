defmodule CurrencyWatch.Repo.Migrations.CreateCurrency do
  use Ecto.Migration

  def change do
    create table(:currencies) do
      add :code, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:currencies, [:code])
  end
end
