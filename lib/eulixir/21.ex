defmodule Eulixir.Problem21 do
  @moduledoc "https://projecteuler.net/problem=21"

  import Multitool.Numbers.Factors


  def solve() do
    find_amicable(220, 10000, MapSet.new()) 
    |> Enum.sum()
  end


  def find_amicable(start, finish, acc) when start >= finish, do: acc

  def find_amicable(start, finish, acc) do
    # Find the sum of natural divisors for the current number, our first candidate
    candidate = aliquot_sum(start)

    # Find the sum of all natural divisors of our candidate
    backwards_candidate = aliquot_sum(candidate)

    new_accumulator = cond do 
      candidate == backwards_candidate -> acc
      start == backwards_candidate -> MapSet.union(acc, MapSet.new([start, backwards_candidate]))
      true -> acc
    end


    find_amicable(start + 1, finish, new_accumulator)
  end



end
