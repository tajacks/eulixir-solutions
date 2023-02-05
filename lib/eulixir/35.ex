defmodule Eulixir.Problem35 do
  @moduledoc "https://projecteuler.net/problem=35"

  import Multitool.Numbers.Primes
  import Multitool.Numbers, only: [cycles: 1] 

  def solve() do
    primes_before(1_000_000)
    |> Stream.map(&cycles(&1))
    |> Stream.filter(fn list -> Enum.all?(list, fn i -> prime?(i) end) end)
    |> Enum.count()
  end

end
