defmodule Eulixir.Problem23 do
  @moduledoc "https://projecteuler.net/problem=23"

  import Multitool.Numbers.Factors

  def solve() do
    abundant = sums_in(1..28122, :abundant) |> MapSet.new()

    1..28122
    |> MapSet.new()
    |> MapSet.difference(abundant)
    |> Enum.sum()
  end

end
