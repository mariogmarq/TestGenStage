defmodule FreeRamTest do
  use ExUnit.Case
  doctest FreeRam

  test "Returns an string in killobytes" do
    data = FreeRam.get
    assert String.contains?(data, "kB\n")
    assert data |> String.split |> hd |> String.to_integer > 0
  end
end
