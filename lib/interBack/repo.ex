defmodule InterBack.Repo do
  use Ecto.Repo,
    otp_app: :interBack,
    adapter: Ecto.Adapters.Postgres
end
