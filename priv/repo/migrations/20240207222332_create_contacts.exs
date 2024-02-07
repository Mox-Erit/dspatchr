defmodule Dspatchr.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :comm_status, :string
      add :comm_attempt, :integer
      add :last_comm_attempt_time, :utc_datetime
      add :vehicle, :string
    end
  end
end
