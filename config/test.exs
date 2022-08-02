import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :task_app, TaskApp.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "task_app_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :task_app, TaskAppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "CyGHrcOjsL4VoUHR+lunyM5W/pMhL6pp5g75QzvSB6Dco8z2fu7NyA5f9ZXwVUkt",
  server: false

# In test we don't send emails.
config :task_app, TaskApp.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
