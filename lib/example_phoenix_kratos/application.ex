defmodule ExamplePhoenixKratos.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ExamplePhoenixKratosWeb.Telemetry,
      # Start the Ecto repository
      ExamplePhoenixKratos.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ExamplePhoenixKratos.PubSub},
      # Start Finch
      {Finch, name: ExamplePhoenixKratos.Finch},
      # Start the Endpoint (http/https)
      ExamplePhoenixKratosWeb.Endpoint
      # Start a worker by calling: ExamplePhoenixKratos.Worker.start_link(arg)
      # {ExamplePhoenixKratos.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ExamplePhoenixKratos.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ExamplePhoenixKratosWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
