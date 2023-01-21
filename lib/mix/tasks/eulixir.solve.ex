defmodule Mix.Tasks.Eulixir.Solve do
  @moduledoc """
  Runs the code present in the assosciated problem file with optional benchmarking

  Shorthand 's' is also accepted in place of 'eulixir.solve'

  When choosing which methods to run, the mix task looks for a function 
  names `solve`, and/or any number of functions that start with `solve_`
  When multiple functions are found following this format, all will be 
  run and/or benchmarked

  ## Flags 
  
      -h : Shows this help information

      -b : Enables benchmarking

  ## Usage 
      
      $ mix eulixir.solve <FLAGS> <SOLUTION_NUMBER>

  ## Examples

      $ mix eulixir.solve -h
      -> Shows this help screen

      $ mix eulixir.solve 3
      -> Displays your solution(s) for problem 3, if present
      
      $ mix eulixir.solve 3 -b 
      -> Displays your solution(s) for problem 3, along with benchmarking results
  """
  use Mix.Task

  def run(args) do
    parsed = 
      OptionParser.parse(args,
        strict: [
        help: :boolean,
          benchmark: :boolean
        ],
        aliases: [h: :help, b: :benchmark])

    case parsed do
      {[help: true], _, _} -> help()
      {[], args, []} -> run_solutions(Enum.take(args, 1)) 
      {[benchmark: true], args, []} -> benchmark_solutions(Enum.take(args, 1))
      _ -> help()
    end
  end

  def run_solutions(problem_number) do
    mod = module(problem_number)
    get_functions(mod)
    |> Enum.each(fn f -> IO.inspect(apply(mod, f, []), label: "Problem #{problem_number} solution #{f}")
    end)
  end

  def benchmark_solutions(problem_number) do
    mod = module(problem_number)
          
    get_functions(mod)
    |> Map.new(fn k -> { Atom.to_string(k), fn -> apply(mod, k, []) end }  end)
    |> Benchee.run()
  end

  def get_functions(module) do
    module.__info__(:functions)
    |> Enum.map(fn {fun_name, _} -> fun_name end)
    |> Enum.filter(&(String.match?(Atom.to_string(&1), ~r/^solve($|_).*$/)))
  end

  def module(number), do: Module.concat("Elixir", "Eulixir.Problem#{number}")

  def help, do: @moduledoc
end
