defmodule ZacnePrzedszkoleApiElixir.School do
  use ZacnePrzedszkoleApiElixir.Web, :model

  schema "schools" do
    field :name, :string
    field :address, :string
    field :postcode, :string
    field :city, :string
    field :regon, :string
    field :schooltype, :string
    field :ownershiptype, :string
    field :email, :string
    field :phone, :string
    field :rspo, :string
    field :latitude, :float
    field :longitude, :float
    field :stars, :float

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
