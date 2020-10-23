# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phoenix_twitch_chat_bot,
  ecto_repos: [PhoenixTwitchChatBot.Repo]

# Configures the endpoint
config :phoenix_twitch_chat_bot, PhoenixTwitchChatBotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "32yfMCeqPtYbFQix/tPJ5jOJdygv3NROS1J/1UnCB775suTHNwrgj3/71Sxq51W3",
  render_errors: [view: PhoenixTwitchChatBotWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: PhoenixTwitchChatBot.PubSub,
  live_view: [signing_salt: "fZsGGxFw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"