defmodule Eulixir.Problem10 do
  @moduledoc "https://projecteuler.net/problem=10"

  import Multitool.Numbers.Primes

  def solve() do
    primes()
    |> Enum.take_while(&(&1 < 2_000_000))
    |> Enum.sum()
  end

end
