defmodule ZacnePrzedszkoleApiElixir.Repo.Migrations.SchoolsStarsDefault do
  use Ecto.Migration

  def change do
    alter table(:schools) do
      modify :stars, :float, null: false, default: 0.0
    end
  end
end
