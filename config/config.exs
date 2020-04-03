# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :matrimandir,
  ecto_repos: [Matrimandir.Repo]

# Configures the endpoint
config :matrimandir, MatrimandirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MkOXWo46psc5snvoWZj6I/lRbgDwyVTxdoSelcv+iCB4VJXuWgh56lDJRcVp3xJX",
  render_errors: [view: MatrimandirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Matrimandir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :matrimandir, Matrimandir.Mailer,
  adapter: Bamboo.MailgunAdapter,
  api_key: "my_api_key"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
