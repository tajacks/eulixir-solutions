defmodule Eulixir.Problem9 do
  @moduledoc "https://projecteuler.net/problem=9"

  def solve() do
    _solve(3)  
  end

  def _solve(c) do
    cs = :math.pow(c, 2)
    
    res = for b <- 2..c-1, a <- 1..b-1, sqr_add(a, b) == cs, a + b + c == 1000, do: {a, b}
    case res do
      [] -> _solve(c + 1)
      [{t, j} | _] -> t * j * c
    end
  end

  def sqr_add(a, b), do: :math.pow(a, 2) + :math.pow(b, 2)

end
