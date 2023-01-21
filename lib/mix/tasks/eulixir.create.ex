defmodule Mix.Tasks.Eulixir.Create do
  @moduledoc """
  Creates or resets problem files to their defaults

  Shorthand of 'c' is also accepted in place of 'eulixir.create'

  ## Flags

      -h : Shows this help information

      -r : Reset. Overwrite files if already present. May result in loss of solutions

  ## Usage

      $ mix eulixir.create <FLAGS> <SOLUTION_NUMBER> <OPTIONAL_SOLUTION_NUMBER>


  When a single solution number is provided, only that solution is created or 
  reset (if the -r or --reset flag is present)


  When two solution numbers are provided, and the second is greater than the first,
  a range of files are creates. 

  ## Examples 

      $ mix eulixir.create -h 
      -> Shows this help screen

      $ mix eulixir.create 3
      -> Creates one file named `3.ex` in the `lib/eulixir` directory if it does not exist

      $ mix eulixir.create 1 3 --reset
      -> Creates three files (`1.ex, 2.ex, 3.ex`) in the `lib/eulixir` directory, overwritting 
      existing files of the same name

      $ mix eulixir.create 3 1
      -> Does nothing, invalid range
  """
  use Mix.Task

  def run(args) do
    parsed =
      OptionParser.parse(args,
        strict: [
          help: :boolean,
          reset: :boolean
        ],
        aliases: [h: :help, r: :reset]
      )

    case parsed do
      {[help: true], _, _} -> help()
      {[], args, []} -> write_files(args, false)
      {[reset: true], args, []} -> write_files(args, true)
      _ -> help()
    end
  end

  def write_files(args, overwrite) do
    args = Enum.map(args, fn x -> String.to_integer(x) end)
    range_args = Enum.take(args, 2)

    case range_args do
      [] -> IO.puts("Empty range, no files generated")
      [head | _tail = []] -> generate_range(head) |> Enum.each(&write_file(&1, overwrite))
      [head | tail] -> generate_range(head, hd(tail)) |> Enum.each(&write_file(&1, overwrite))
    end
  end

  defp write_file(number, true) when is_integer(number) and number > 0 do
    generate_path(number)
    |> File.write(generate_base(number))
    |> log_file(number)
  end

  defp write_file(number, false) when is_integer(number) and number > 0 do
    path = generate_path(number)

    if File.exists?(path) do
      IO.puts("Not overwriting existing file at #{path}, use --reset to bypass this protection")
    else
      File.write(path, generate_base(number))
      |> log_file(number)
    end
  end

  def generate_path(number) do
    "./lib/eulixir/#{number}.ex"
  end

  def generate_base(number) do
    """
    defmodule Eulixir.Problem#{number} do
      @moduledoc "https://projecteuler.net/problem=#{number}"

      def solve() do
      
      end
    end
    """
  end

  def generate_range(start), do: generate_range(start, start)

  def generate_range(start, finish) when is_integer(start) and is_integer(finish) do
    cond do
      start <= finish -> Enum.to_list(start..finish)
      true -> []
    end
  end

  def generate_range(_, _), do: []

  def help, do: IO.puts(@moduledoc)

  defp log_file(result, number) do
   case result do
     :ok -> IO.puts("Wrote file for problem #{number}")
     _ -> IO.puts("Unable to write file for problem #{number}")  
    end 
  end
end
