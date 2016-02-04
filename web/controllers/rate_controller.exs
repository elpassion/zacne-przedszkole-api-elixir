defmodule ZacnePrzedszkoleApiElixir.RateController do
  use ZacnePrzedszkoleApiElixir.Web, :controller
  alias ZacnePrzedszkoleApiElixir.RateOperations
  alias ZacnePrzedszkoleApiElixir.School

  def create(conn, %{"school_id" => school_id, "stars" => stars}) do
    school = Repo.get!(School, school_id)
    RateOperations.create(school, stars)    
    render(conn, "show.json", school: school)
  end
end
