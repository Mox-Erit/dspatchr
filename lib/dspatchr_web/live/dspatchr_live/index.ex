defmodule DspatchrWeb.DspatchrLive.Index do
  use DspatchrWeb, :live_view

  # ===========================================================================
  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :contacts, Dspatchr.list_contacts())}
  end

  # ===========================================================================
  def comm_status_display_value(nil), do: "-"
  def comm_status_display_value(val), do: val

  # ===========================================================================
  def comm_attempt_display_value(0), do: "-"
  def comm_attempt_display_value(val), do: val

  # ===========================================================================
  def last_comm_attempt_time_display_value(nil), do: "-"
  def last_comm_attempt_time_display_value(val), do: val
end
