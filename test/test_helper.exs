

ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ZacnePrzedszkoleApiElixir.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ZacnePrzedszkoleApiElixir.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ZacnePrzedszkoleApiElixir.Repo)
