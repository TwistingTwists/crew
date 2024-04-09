defmodule Crew.Repo do
  use Ecto.Repo,
    otp_app: :crew,
    adapter: Ecto.Adapters.Postgres
end
