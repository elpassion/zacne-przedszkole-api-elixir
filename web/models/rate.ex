defmodule ZacnePrzedszkoleApiElixir.Rate do
  use ZacnePrzedszkoleApiElixir.Web, :model

  schema "rates" do
    field :stars, :integer
    field :ip, :string
    belongs_to :school, ZacnePrzedszkoleApiElixir.School

    timestamps
  end

  @required_fields ~w(school_id stars)
  @optional_fields ~w(ip)

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
