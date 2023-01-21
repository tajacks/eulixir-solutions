defmodule Eulixir.Problem3 do
  @moduledoc "https://projecteuler.net/problem=3"

  import Multitool.Numbers.Factors
  import Multitool.Numbers.Primes

  def solve() do
    600851475143
    |> factors_of()
    |> Enum.filter(&(prime?/1))
    |> Enum.max()
  end
end
