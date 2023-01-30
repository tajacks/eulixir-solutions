defmodule Eulixir.Problem16 do
  @moduledoc "https://projecteuler.net/problem=16"

  def solve() do
    :math.pow(2, 1000) |> trunc() |> Integer.digits() |> Enum.sum()      
  end
end
