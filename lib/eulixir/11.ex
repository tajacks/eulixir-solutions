defmodule Eulixir.Problem11 do
  @moduledoc "https://projecteuler.net/problem=11"

  def solve() do
    {:ok, grid_raw} = File.read("resources/11.txt")

    grid =
      grid_raw
      |> String.split("\n")
      |> Enum.reverse()
      |> Enum.filter(fn s -> s != "" end)
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {val, y}, acc ->
        val
        |> String.split(" ")
        |> Enum.map(&String.to_integer/1)
        |> Enum.with_index()
        |> Enum.reduce(%{}, fn {val, x}, acc_row -> Map.put(acc_row, {x, y}, val) end)
        |> Map.merge(acc)
      end)
    
    Map.keys(grid)
    |> Enum.map(&sum_all_directions(&1, grid))
    |> Enum.max()
  end

  defp sum_all_directions(key, grid) do
    left = sum_dir(key, fn {x, y} -> {x - 1, y} end, grid, 0, 1) 
    right = sum_dir(key, fn {x, y} -> {x + 1, y} end, grid, 0, 1)
    up = sum_dir(key, fn {x, y} -> {x, y + 1} end, grid, 0, 1)
    down = sum_dir(key, fn {x, y} -> {x, y - 1} end, grid, 0, 1)
    dl = sum_dir(key, fn {x, y} -> {x - 1, y - 1} end, grid, 0, 1)
    dr = sum_dir(key, fn {x, y} -> {x + 1, y - 1} end, grid, 0, 1)
    ur = sum_dir(key, fn {x, y} -> {x + 1, y + 1} end, grid, 0, 1)
    ul = sum_dir(key, fn {x, y} -> {x - 1, y + 1} end, grid, 0, 1)
    [left, right, up, down, dl, dr, ur, ul] |> Enum.max()
  end

  defp sum_dir({x, y} = position, pos_fun, grid, c, acc) do
    cond do
      c == 4 -> acc
      x == -1 -> 0
      y == -1 -> 0
      x == 20 -> 0
      y == 20 -> 0
      true -> sum_dir(pos_fun.(position), pos_fun, grid, c + 1, acc * Map.get(grid, position))
    end
  end
end


