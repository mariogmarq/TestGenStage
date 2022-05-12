defmodule FreeRam do
  def get do
    (
      File.read!("/proc/meminfo")
    |> String.splitter("\n")
    |> Enum.filter(fn x -> String.contains?(x, "MemAvailable") end)
    |> hd
    |> String.split
    |> tl
    |> hd
     ) <> " kB\n"
  end
end
