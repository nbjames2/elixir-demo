defmodule ElixirDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: ElixirDemo.Worker.start_link(arg)
      # {ElixirDemo.Worker, arg}
      Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: ElixirDemo.Router, options: [port: 8085])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
