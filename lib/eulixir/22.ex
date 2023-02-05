defmodule Eulixir.Problem22 do
  @moduledoc "https://projecteuler.net/problem=22"

  def solve() do
    {:ok, names} = File.read("resources/p022_names.txt")

    names
    |> String.split(",")
    |> Enum.map(fn name -> String.replace(name, "\"", "") end)
    |> Enum.sort()
    |> Enum.map(&map_chars/1)
    |> sum_results(1)
  end

  defp map_chars(str), do: str |> String.to_charlist() |> Enum.map(&(&1 - 64)) |> Enum.sum()

  defp sum_results([], _position), do: 0

  defp sum_results([head | tail], position), do: head * position + sum_results(tail, position + 1)
end
