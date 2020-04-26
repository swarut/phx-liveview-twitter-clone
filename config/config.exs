# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :twitter_clone,
  ecto_repos: [TwitterClone.Repo]

# Configures the endpoint
config :twitter_clone, TwitterCloneWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "O1I6JfV8liCgnNCGQ5kfIATEy6RSM+uM6drnVtkx6c2xT81Nvpo2t9fd90KsPiaG",
  render_errors: [view: TwitterCloneWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: TwitterClone.PubSub,
  live_view: [signing_salt: "rf80caCU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
