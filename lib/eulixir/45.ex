defmodule Eulixir.Problem45 do
  @moduledoc "https://projecteuler.net/problem=45"

  import Multitool.Numbers.Figurate

  def solve() do
    # All hexagonals are triangular
    Stream.iterate(144, &(&1 + 1))
    |> Stream.map(&hexagonal/1)
    |> Stream.filter(&pentagonal?/1)
    |> Enum.take(1)
  end

end
