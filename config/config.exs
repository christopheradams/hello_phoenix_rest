# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :hello_phoenix_rest,
  ecto_repos: [HelloPhoenixRest.Repo]

# Configures the endpoint
config :hello_phoenix_rest, HelloPhoenixRest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zf+Hclc05gs/XoCEe4iAgJ+g6RSSSLMihT/dZMueiV1V95zUdFxJ1tDOrbRjD664",
  render_errors: [view: HelloPhoenixRest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HelloPhoenixRest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure plug_rest
config :plug_rest,
  known_methods: ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS", "TRACE"]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
