defmodule Dspatchr.Contact do
  use Ecto.Schema

  schema "contacts" do
    field :name, :string
    field :vehicle, :string

    field :comm_status, Ecto.Enum,
      values: [:contacting, :vehicle_dispatched, :no_answer]

    field :comm_attempt, :integer, default: 0
    field :last_comm_attempt_time, :utc_datetime
  end
end
