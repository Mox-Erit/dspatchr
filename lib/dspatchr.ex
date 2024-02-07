defmodule Dspatchr do
  @moduledoc """
  Dspatchr manages requesting and dispatching vehicles.
  """
   import Ecto.Query
   alias Dspatchr.Repo
   alias Dspatchr.Contact

   # ===========================================================================
   def list_contacts do
     Contact
     |> order_by(:name)
     |> Repo.all()
   end
end
