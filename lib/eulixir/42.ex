defmodule Eulixir.Problem42 do
  @moduledoc "https://projecteuler.net/problem=42"

  import Multitool.Numbers.Figurate

  def solve() do
    {:ok, contents} = File.read("resources/42.txt")
    contents 
    |> String.split(",", trim: true) 
    |> Enum.map(fn name -> String.replace(name, "\"", "") end)
    |> Enum.map(&map_chars/1)
    |> Enum.filter(&triangle?/1)
    |> Enum.count()
  end


  defp map_chars(str), do: str |> String.to_charlist() |> Enum.map(&(&1 - 64)) |> Enum.sum()
end
