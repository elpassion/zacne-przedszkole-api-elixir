defmodule ZacnePrzedszkoleApiElixir.SchoolControllerTest do
  use ZacnePrzedszkoleApiElixir.ConnCase


  alias ZacnePrzedszkoleApiElixir.School
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, school_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    school = Repo.insert! %School{stars: 0.0}
    conn = get conn, school_path(conn, :show, school)
    assert json_response(conn, 200) == school_hash(school)
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, school_path(conn, :show, -1)
    end
  end

  test "/locations returns list of schools", %{conn: conn} do
    school = %School{ name: "Test School", latitude: 1.0, longitude: 1.0, stars: 0.0 } |> Repo.insert!

    conn = get conn, school_path(conn, :locations)

    # assert response.status == 200
    assert json_response(conn, 200) == [%{"id" => school.id, "latitude" => school.latitude, "longitude" => school.longitude, "name" => school.name}]
  end

  test "/ranking returns list of schools", %{conn: conn} do
    school = %School{ name: "Test School", latitude: 1.0, longitude: 1.0, stars: 0.0 } |> Repo.insert!

    conn = get conn, school_path(conn, :ranking, %{limit: 10, offset: 0})
    assert Enum.count(json_response(conn, 200)) == 1
  end

  test "/ranking returns max limit schools", %{conn: conn} do
    Enum.each(1..15, fn(i) ->
      %School{ name: "Test School #{i}", latitude: 1.0, longitude: 1.0, stars: 0.0 } |> Repo.insert!
    end)

    conn = get conn, school_path(conn, :ranking, %{limit: 10, offset: 0})
    assert Enum.count(json_response(conn, 200)) == 10
  end

  test "/search find school with proper name", %{conn: conn} do
    school = %School{ name: "Test School", latitude: 1.0, longitude: 1.0, stars: 0.0 } |> Repo.insert!

    conn = get conn, school_path(conn, :search, %{query: "test"})
    assert List.first(json_response(conn, 200))["id"] == school.id
  end

  def school_hash(school) do
    %{
      "address" => school.address, "city" => school.city, "email" => school.email, "id" => school.id, "latitude" => school.latitude, "longitude" => school.longitude,
      "name" => school.name, "ownershiptype" => school.ownershiptype, "phone" => school.phone, "postcode" => school.postcode, "regon" => school.regon,
      "rspo" => school.rspo, "schooltype" => school.schooltype, "stars" => school.stars
    }
  end
end
