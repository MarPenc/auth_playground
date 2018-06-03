use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auth_playground, AuthPlaygroundWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :auth_playground, AuthPlayground.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "wanderer",
  password: "wanderer",
  database: "auth_playground_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
