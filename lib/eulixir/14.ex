defmodule Eulixir.Problem14 do
  @moduledoc "https://projecteuler.net/problem=14"

  import Multitool.Numbers.Sequence

  def solve() do
    1..999_999 |> Enum.sort_by(&collatz_len/1, :desc) |> Enum.at(0) 
  end
end
