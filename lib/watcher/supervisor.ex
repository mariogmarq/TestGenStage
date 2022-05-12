defmodule Watcher.Supervisor do
  use Application

  def start(_type, _args) do
    import Supervisor, warn: false

    children = [
      {Watcher.Producer, 0},
      {Watcher.Consumer, []}
    ]

    opts = [strategy: :one_for_one, name: Watcher.Supervisor]
    Supervisor.start_link(children, opts)
  end


end
