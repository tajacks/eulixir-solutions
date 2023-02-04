defmodule Eulixir.Problem24 do
  @moduledoc "https://projecteuler.net/problem=24"
    
  import Multitool.Collections.ListOperations

  def solve() do
    permutations([0,1,2,3,4,5,6,7,8,9]) |> Enum.sort() |> Enum.at(999_999) 
  end
end
