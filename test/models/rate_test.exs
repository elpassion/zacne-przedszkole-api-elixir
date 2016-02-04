defmodule ZacnePrzedszkoleApiElixir.RateTest do
  use ZacnePrzedszkoleApiElixir.ModelCase
  alias ZacnePrzedszkoleApiElixir.School
  alias ZacnePrzedszkoleApiElixir.Rate

  @valid_attrs %{ip: "some content", school_id: 42, stars: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Rate.changeset(%Rate{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Rate.changeset(%Rate{}, @invalid_attrs)
    refute changeset.valid?
  end
end
