defmodule Watcher.Producer do
  use GenStage

  def start_link(_) do
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    {:producer, ""}
  end

  def read_ram() do
    data = FreeRam.get()
    Process.sleep(1000)
    data
  end

  def handle_demand(demand, state) when demand > 0 do
    data = read_ram()

    {:noreply, [data | List.duplicate(:null, demand-1)], state}
  end
end
