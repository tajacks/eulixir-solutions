# Eulixir

Eulixir is a base project for generating and running [Project Euler](https://projecteuler.net) solutions.

Eulixir uses `mix` tasks to both generate base files to be completed with your solutions and run (or benchmark) your
solutions. The answers to problems are not included in this repository. Project Euler makes it very clear that sharing 
answers beyond the first 100 is frowned upon.

## Usage

### Getting Started

Getting started is simple. Clone the repository and download the project dependency (Benchee)

```
git clone https://github.com/tajacks/eulixir.git
cd eulixir
mix deps.get
```

### Generating Boilerplate

The mix task to create a new file is `eulixir.create`, or `c` as shorthand. The general syntax is as follows:

`mix eulixir.create <FLAGS> <SOLUTION_NUMBER> <OPTIONAL_SOLUTION_NUMBER>`

A generated problem file will contain the following Elixir. The text within alligator brackets are variables and will be different with each puzzle.

```
defmodule Eulixir.Problem<PROBLEM_NUMBER> do
  @moduledoc "https://projecteuler.net/problem=<PROBLEM_NUMBER>"

  def solve() do
  
  end
end
```

When a single solution number is provided, only that solution is created or reset (if the `-r` or `--reset` flag
is present)

When two solution numbers are provided, and the second is greater than the first, a range of files are creates. 

#### Examples 

```
$ mix eulixir.create -h 
-> Shows the help screen

$ mix eulixir.create 3
-> Creates one file named `3.ex` in the `lib/eulixir` directory if it does not exist

$ mix eulixir.create 1 3 --reset
-> Creates three files (`1.ex, 2.ex, 3.ex`) in the `lib/eulixir` directory, overwritting 
existing files of the same name

$ mix eulixir.create 3 1
-> Does nothing, invalid range
```

### Running solutions

The mix task to run the solutions in a file is `eulixir.solve`, or `s` as shorthand. The general syntax is as follows:

`mix eulixir.solve <FLAGS> <SOLUTION_NUMBER>`

When running, Eulixir looks for any functions that are either exactly named `solve` or start with `solve_`. All will 
be run. This feature allows you to add as many solutions to the same file as you'd like to compare runtime or output.

#### Examples

```
$ mix eulixir.solve -h
-> Shows this help screen

$ mix eulixir.solve 3
-> Displays your solution(s) for problem 3, if present
```

### Benchmarking

Benchmarking uses [Benchee](https://hexdocs.pm/benchee/Benchee.html) and is enabled by passing the `-b` flag to the 
solve mix task. When the benchmarking flag is enabled, the same rules for determining functions to run as described 
above, apply. 

#### Examples

```
$ mix eulixir.solve 3 -b 
-> Displays your solution(s) for problem 3, along with benchmarking results
```
