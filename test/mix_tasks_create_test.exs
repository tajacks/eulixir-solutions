defmodule MixTasksGenTest do

  use ExUnit.Case, async: true

  import Mix.Tasks.Eulixir.Create

  test "can generate range" do
    assert generate_range("invalid", "things") == []
    assert generate_range(3, 2) == []
    assert generate_range(1, 5) == [1, 2, 3, 4, 5]
    assert generate_range(1) == [1]
  end

  test "can generage path" do
    assert generate_path(10) == "./lib/eulixir/10.ex"
  end
end
