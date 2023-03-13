defmodule Eulixir.Problem17 do
  @moduledoc "https://projecteuler.net/problem=17"

  @bases %{
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
  }

  @the_tens %{
    1 => "ten",
    2 => "twenty",
    3 => "thirty",
    4 => "forty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }

  def solve() do
    1..1000
    |> Enum.map(&stringify_number/1)
    |> Enum.map(&String.length/1)
    |> Enum.sum()
  end

  def stringify_number(1000), do: "onethousand"

  def stringify_number(number) do
    digits = Integer.digits(number)

    case length(digits) do
      1 -> Map.get(@bases, number)
      2 -> handle_two_digits(digits)
      3 -> handle_three_digits(digits)
    end
  end

  def handle_three_digits([head, 0, 0]), do: Map.get(@bases, head) <> "hundred"

  def handle_three_digits([head | tail]),
    do: Map.get(@bases, head) <> "hundredand" <> handle_two_digits(tail)

  def handle_two_digits([x, 0]), do: Map.get(@the_tens, x)

  def handle_two_digits([0, x]), do: Map.get(@bases, x)

  def handle_two_digits(list = [head | tail]) do
    Map.get(@bases, Integer.undigits(list), Map.get(@the_tens, head) <> Map.get(@bases, hd(tail)))
  end
end
