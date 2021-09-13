# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :interBack,
  ecto_repos: [InterBack.Repo]

  config :interBack, InterBack.Guardian,
    issuer: "interBack",
    secret_key: "HzJarFbzFPce/GBP+0uIwPaz9uobGlZOBDzXro5jtvstNfVA+aFnYJulYmIiq5jT"

config :interBack, InterBack.Mailer,
    adapter: Bamboo.SendGridAdapter,
    adapter: Bamboo.SendGridAdapter
    # api_key: "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"

# Configures the endpoint
config :interBack, InterBackWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "jLByz5JmW+a2Kyws3jk6ceii4OeoVJ2dsErBA9iv4BFe1UbTjVNMKITHLtM84Kkx",
  render_errors: [view: InterBackWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: InterBack.PubSub,
  live_view: [signing_salt: "Fhkl8ShV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Comeonin configs
# config :comeonin, :pbkdf2_rounds, 120_000
# config :comeonin, :pbkdf2_salt_len, 512

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
