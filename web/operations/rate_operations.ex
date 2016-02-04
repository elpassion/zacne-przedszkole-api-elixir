defmodule ZacnePrzedszkoleApiElixir.Operations.RateOperations do
  import Ecto.Query

  alias ZacnePrzedszkoleApiElixir.Repo
  alias ZacnePrzedszkoleApiElixir.Rate
  alias ZacnePrzedszkoleApiElixir.School

  def create(school, stars) do
    %Rate{ school_id: school.id, stars: stars} |> Repo.insert!

    query = from r in Rate, where: r.school_id == ^school.id, select: avg(r.stars)

    average_rate = Repo.one(query)
    {average_rate_float, _} = Float.parse(Decimal.to_string(average_rate, :normal))
    Repo.update_all((from s in School, where: s.id == ^school.id), set: [stars: average_rate_float])
  end
end
