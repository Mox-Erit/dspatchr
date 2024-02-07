defmodule Dspatchr.Repo do
  use Ecto.Repo,
    otp_app: :dspatchr,
    adapter: Ecto.Adapters.Postgres
end
