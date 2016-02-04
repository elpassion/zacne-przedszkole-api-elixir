defmodule ZacnePrzedszkoleApiElixir.SchoolView do
  use ZacnePrzedszkoleApiElixir.Web, :view

  def render("index.json", %{schools: schools}) do
    %{data: render_many(schools, ZacnePrzedszkoleApiElixir.SchoolView, "school.json")}
  end

  def render("show.json", %{school: school}) do
    render_one(school, ZacnePrzedszkoleApiElixir.SchoolView, "school.json")
  end

  def render("school.json", %{school: school}) do
    %{
      id: school.id, name: school.name, address: school.address, postcode: school.postcode,
      city: school.city, regon: school.regon, ownershiptype: school.ownershiptype, schooltype: school.schooltype,
      email: school.email, phone: school.phone, rspo: school.rspo, latitude: school.latitude, longitude: school.longitude,
      stars: school.stars
    }
  end

  def render("ranking.json", %{schools: schools}) do
    render_many(schools, ZacnePrzedszkoleApiElixir.SchoolView, "school.json")
  end

  def render("locations.json", %{schools: schools}) do
    render_many(schools, ZacnePrzedszkoleApiElixir.SchoolView, "location.json")
  end

  def render("location.json", %{school: school}) do
    %{id: school.id, longitude: school.longitude, latitude: school.latitude, name: school.name}
  end
end
