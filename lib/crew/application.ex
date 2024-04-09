defmodule Crew.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      CrewWeb.Telemetry,
      Crew.Repo,
      {DNSCluster, query: Application.get_env(:crew, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Crew.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Crew.Finch},
      # Start a worker by calling: Crew.Worker.start_link(arg)
      # {Crew.Worker, arg},
      # Start to serve requests, typically the last entry
      CrewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Crew.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
