# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dspatchr.Repo.insert!(%Dspatchr.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Dspatchr.Contact
alias Dspatchr.Repo

%Contact{name: "Logity Dispatch"} |> Repo.insert!()
%Contact{name: "Resolute Logistics"} |> Repo.insert!()
%Contact{name: "Nationwide Transport Services"} |> Repo.insert!()
%Contact{name: "Ninja Dispatch"} |> Repo.insert!()
%Contact{name: "Missouri River Logisitics, LLC"} |> Repo.insert!()
%Contact{name: "Knights Towing"} |> Repo.insert!()
%Contact{name: "Freight Waves"} |> Repo.insert!()
%Contact{name: "Tailwind Transportation"} |> Repo.insert!()
%Contact{name: "AFT Dispatch"} |> Repo.insert!()
%Contact{name: "FleetCare Group"} |> Repo.insert!()
