defmodule Eulixir.Problem37 do
  @moduledoc "https://projecteuler.net/problem=37"

  import Multitool.Numbers.Primes
  import Multitool.Numbers

  def solve() do
    Stream.iterate(9, &(&1 + 1))
    |> Stream.filter(&right_truncatable_prime?/1)
    |> Stream.filter(&left_truncatable_prime?/1)
    |> Enum.take(11)
    |> Enum.sum()
  end

  def right_truncatable_prime?(0), do: true

  def right_truncatable_prime?(n) do
    case prime?(n) do
      true -> right_truncatable_prime?(trim_right(n))
      false -> false
    end
  end

  def left_truncatable_prime?(0), do: true

  def left_truncatable_prime?(n) do
    case prime?(n) do
      true -> left_truncatable_prime?(trim_left(n))
      false -> false
    end
  end

end
