# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :auth_playground,
  ecto_repos: [AuthPlayground.Repo]

# Configures the endpoint
config :auth_playground, AuthPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HzI7HVHwN5/1P8GMr/jq/zC7ieXIfoxjKxBSYZFg9ClLPmkIK8iLTm7MxgXhRQWV",
  render_errors: [view: AuthPlaygroundWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AuthPlayground.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
