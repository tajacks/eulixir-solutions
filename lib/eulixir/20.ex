defmodule Eulixir.Problem20 do
  @moduledoc "https://projecteuler.net/problem=20"

  import Multitool.Numbers.Factorial

  def solve() do
    factorial(100) |> Integer.digits() |> Enum.sum() 
  end
end
