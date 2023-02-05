defmodule Eulixir.Problem49 do
  @moduledoc "https://projecteuler.net/problem=49"

  import Multitool.Numbers.Primes
  import Multitool.Collections.ListOperations

  def solve() do
    primes_after(999)
    |> Stream.filter(fn x -> x != 1487 end)
    |> Stream.map(fn x -> {x, x + 3330, x + 6660} end)
    |> Stream.filter(fn {a, b, c} -> all_permutations?(a, b, c) end)
    |> Stream.filter(fn {_a, b, c} -> prime?(b) && prime?(c) end)
    |> Enum.take(1)
  end

  defp all_permutations?(a, b, c) do
    pool = a |> Integer.digits()

    b |> Integer.digits() |> permutations() |> Enum.member?(pool) &&
      c |> Integer.digits() |> permutations() |> Enum.member?(pool)
  end
end
