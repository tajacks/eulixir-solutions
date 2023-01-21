defmodule Eulixir.Problem4 do
  @moduledoc "https://projecteuler.net/problem=4"

  def solve() do
    all_nums = for x <- 1..999, y <- 1..999, do: x * y 

    all_nums
    |> (Enum.filter(&is_palindrome?(&1)))
    |> (Enum.max())
    |> IO.puts()
  end

  def is_palindrome?(n) do
    digits = Integer.digits(n)
    digits == Enum.reverse(digits)
  end
end
