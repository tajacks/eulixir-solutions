defmodule Eulixir.Problem29 do
  @moduledoc "https://projecteuler.net/problem=29"

  def solve() do
    pow = for a <- 2..100, b <- 2..100, do: :math.pow(a, b)
    pow |> Enum.uniq() |> Enum.count()
  end
end
