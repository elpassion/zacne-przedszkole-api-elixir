defmodule ZacnePrzedszkoleApiElixir.SchoolController do
  use ZacnePrzedszkoleApiElixir.Web, :controller
  alias ZacnePrzedszkoleApiElixir.School

  def index(conn, _params) do
    schools = Repo.all(School)
    render(conn, "index.json", schools: schools)
  end

  def show(conn, %{"id" => id}) do
    school = Repo.get!(School, id)
    render(conn, "show.json", school: school)
  end

  def locations(conn, _params) do
    schools = Repo.all(School)
    render(conn, "locations.json", schools: schools)
  end

  def ranking(conn, %{"offset" => offset, "limit" => limit}) do
    query = from school in School, order_by: [desc: school.stars, desc: school.id], limit: ^limit, offset: ^offset
    schools = Repo.all(query)
    render(conn, "ranking.json", schools: schools)
  end

  def search(conn, %{"query" => query}) do
    p = "%#{query}%"
    query = from school in School, where: ilike(school.name, ^p)    
    schools = Repo.all(query)
    render(conn, "search.json", schools: schools)
  end
end
