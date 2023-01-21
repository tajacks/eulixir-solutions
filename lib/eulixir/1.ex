defmodule Eulixir.Problem1 do
  @moduledoc "https://projecteuler.net/problem=1"

  def solve() do 
    3..999
    |> Enum.filter(&is_multiple/1)
    |> Enum.sum()
  end


  def is_multiple(n), do: rem(n, 3) == 0 || rem(n, 5) == 0
end
