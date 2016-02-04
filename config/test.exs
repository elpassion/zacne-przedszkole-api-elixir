use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :zacne_przedszkole_api_elixir, ZacnePrzedszkoleApiElixir.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :zacne_przedszkole_api_elixir, ZacnePrzedszkoleApiElixir.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "aserafin",
  password: "",
  database: "zacne_przedszkole_api_elixir_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
