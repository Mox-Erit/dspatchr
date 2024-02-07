defmodule Dspatchr do
  @moduledoc """
  Dspatchr manages requesting and dispatching vehicles.
  """
   import Ecto.Query
   alias Ecto.Changeset
   alias Dspatchr.Repo
   alias Dspatchr.Contact
   alias Dspatchr.ContactWorker

   # ===========================================================================
    def list_contacts do
     Contact
     |> order_by(:name)
     |> Repo.all()
   end

  # ===========================================================================
   def dspatchr(contacts) do
     contacts
     |> Enum.each(fn contact ->
      %{contact_id: contact.id}
      |> ContactWorker.new()
      |> Oban.insert()
     end)
   end

  # ===========================================================================
   def get_contacts!(id), do: Repo.get!(Contact, id)

  # ===========================================================================
   def update_contact_comm_status!(contact, status, attempt \\ 0) do
    contact
    |> Changset.change(%{
      comm_status: status,
      comm_attempt: attempt,
      last_comm_attempt_time: DateTime.utc_now() |> DateTime.truncate(:second)
    })
    |> Repo.update!()
   end
end
