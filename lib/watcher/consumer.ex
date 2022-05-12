defmodule Watcher.Consumer do
  use GenStage

  def start_link(_) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    {:consumer, %{}, subscribe_to: [{Watcher.Producer, max_demand: 1}]}
  end

  def handle_events(events, _from, state) do
    for event <- events do
      IO.write(:stdio, event)
    end

    {:noreply, [], state}
  end
end
