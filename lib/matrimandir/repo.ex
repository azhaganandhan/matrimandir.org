defmodule Matrimandir.Repo do
  use Ecto.Repo,
    otp_app: :matrimandir,
    adapter: Ecto.Adapters.Postgres
end
