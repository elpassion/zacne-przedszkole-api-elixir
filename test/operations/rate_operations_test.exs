defmodule ZacnePrzedszkoleApiElixir.RateOperationsTest do
  use ZacnePrzedszkoleApiElixir.ModelCase
  alias ZacnePrzedszkoleApiElixir.Operations.RateOperations
  alias ZacnePrzedszkoleApiElixir.School
  alias ZacnePrzedszkoleApiElixir.Rate

  test "changeset with valid attributes" do
    school = %School{name: "Test school", stars: 0.0} |> Repo.insert!
    RateOperations.create(school, 10)

    assert Repo.get!(School, school.id).stars == 10.0
  end
end
