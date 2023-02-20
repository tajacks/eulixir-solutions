defmodule Eulixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :eulixir,
      description: "A base project for running Project Euler solutions",
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      aliases: aliases()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [  {:benchee, "~> 1.0", only: :dev},
       {:multitool, "~> 0.3.4"}
    ]
  end

  defp package do
    [
      name: "eulixir",
      licenses: ["GPL-3.0-only"],
      links: %{"GitHub" => "https://github.com/tajacks/eulixir"}
    ]
  end

  defp aliases do
    [
      s: "eulixir.solve",
      c: "eulixir.create"
    ]
  end
end
