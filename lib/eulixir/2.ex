defmodule Eulixir.Problem2 do
  @moduledoc "https://projecteuler.net/problem=2"

  def solve() do
    Stream.unfold({0, 1}, fn {f1,f2} -> {f1, {f2, f1+f2}} end) 
    |> Enum.take_while(&(&1 < 4_000_000))
    |> Enum.filter(&(rem(&1, 2) == 0))
    |> Enum.sum()
  end
end
