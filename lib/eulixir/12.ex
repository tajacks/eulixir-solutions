defmodule Eulixir.Problem12 do
  @moduledoc "https://projecteuler.net/problem=12"

  import Multitool.Numbers.Triangular
  import Multitool.Numbers.Factors

  def solve() do 
    _solve(1)    
  end

  def _solve(n) do
    triangle_num = nth_triangle_num(n)
    f = factors_of(triangle_num)
    cond do
      length(f) > 500 -> triangle_num
      true -> _solve(n + 1)
    end
  end

end
