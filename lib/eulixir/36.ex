defmodule Eulixir.Problem36 do
  @moduledoc "https://projecteuler.net/problem=36"

  def solve() do
    1..999_999
    |> Stream.map(fn x -> {x, Integer.digits(x)} end)
    |> Stream.filter(fn {_a, b} -> palindrome?(b) end)
    |> Stream.map(fn {a, _b} -> {a, Integer.digits(a, 2)} end)
    |> Stream.filter(fn {_a, b} -> palindrome?(b) end)
    |> Stream.map(fn {a, _b} -> a end)
    |> Enum.sum()

  end

  defp palindrome?(to_test), do: to_test == Enum.reverse(to_test) 

end
