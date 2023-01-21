defmodule Eulixir.Problem6 do
  @moduledoc "https://projecteuler.net/problem=6"

  def solve() do
    abs(sum_squares() - squared_sums())
  end


  def sum_squares() do
    1..100
    |> Enum.map(&round(:math.pow(&1, 2)))
    |> Enum.sum()
  end

  def squared_sums() do
    1..100
    |> Enum.sum()
    |> :math.pow(2)
    |> round
  end
end
