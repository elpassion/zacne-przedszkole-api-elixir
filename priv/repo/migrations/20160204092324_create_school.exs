defmodule ZacnePrzedszkoleApiElixir.Repo.Migrations.CreateSchool do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :address, :string
      add :postcode, :string
      add :city, :string
      add :regon, :string
      add :schooltype, :string
      add :ownershiptype, :string
      add :email, :string
      add :phone, :string
      add :rspo, :string
      add :latitude, :float
      add :longitude, :float
      add :stars, :float, null: false

      timestamps
    end

    create index(:schools, [:rspo], unique: true)

  end
end
