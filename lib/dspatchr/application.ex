defmodule Dspatchr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DspatchrWeb.Telemetry,
      Dspatchr.Repo,
      {DNSCluster, query: Application.get_env(:dspatchr, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Dspatchr.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Dspatchr.Finch},
      # Start a worker by calling: Dspatchr.Worker.start_link(arg)
      # {Dspatchr.Worker, arg},
      # Start to serve requests, typically the last entry
      DspatchrWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dspatchr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DspatchrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
