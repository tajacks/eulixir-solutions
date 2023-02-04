defmodule Eulixir.Problem25 do
  @moduledoc "https://projecteuler.net/problem=25"

  import Multitool.Numbers.Sequence

  def solve() do
    Stream.iterate(1, &(&1 + 1)) 
    |> Stream.map(&{&1, (nth_fibonacci(&1))}) 
    |> Stream.filter(fn {_x, y} -> Integer.digits(y) |> length() == 1000 end) 
    |> Enum.take(1) 
  end
end
