defmodule ZacnePrzedszkoleApiElixir.Repo.Migrations.CreateRate do
  use Ecto.Migration

  def change do
    create table(:rates) do
      add :school_id, :integer
      add :stars, :integer
      add :ip, :string

      timestamps
    end

    create index(:rates, [:school_id])
  end
end
