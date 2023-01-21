defmodule Eulixir.Problem5 do
  @moduledoc "https://projecteuler.net/problem=5"

  def solve() do
    _solve(2520, 2520)
  end
  
  def _solve(start, increment_by) do
    cond do
      is_divisible(start) -> start
      true -> _solve(start + increment_by, increment_by)
    end
  end

  # We only need to check 11..20 because we already know
  # it's divisible by 1..10 (multiple of 2520)
  def is_divisible(n), do: Enum.all?(11..20, &rem(n, &1) == 0) 
end
