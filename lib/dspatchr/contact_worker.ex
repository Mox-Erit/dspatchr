defmodule Dspatchr.ContactWorker do
  use Oban.Worker, queue: :phone_calls, max_attempts: 5

  def perform(%Job{attempt: attempt, args: %{"contact_id" => contact_id}}) do
    contact = Dspatchr.get_contact!(contact_id)

    dspatchr()
    |> case do
      {:ok, :call_connected} ->
        process_result(contact, :vehicle_dispatched, attempt)

        :ok

      {:error, :no_answer} ->
        error_status = error_status(attempt)
        process_result(contact, error_status, attempt)

        {:error, :no_answer}
    end
  end

  defp process_result(contact, status, attempt) do
    Dspatchr.update_status!(
      contact,
      status,
      attempt
    )
  end

  defp dspatchr do
    1..5
    |> Enum.random()
    |> case do
      1 -> {:ok, :call_connected}
      _ -> {:error, :no_answer}
    end
  end

  defp error_status(5 = _attempt), do: :no_answer
  defp error_status(_attempt), do: :contacting

end
