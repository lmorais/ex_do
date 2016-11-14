defmodule ExDo.Mixfile do
  use Mix.Project

  @description """
    Simple Elixir wrapper for the Digital Ocean API
  """

  def project do
    [app: :ex_do,
     version: "0.1.0",
     elixir: "~> 1.3",
     description: @description,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :exjsx]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
   [ {:httpoison, "~> 0.8"},
     {:exjsx, "~> 3.2"},
     {:earmark, "~> 0.2.1", only: :docs},
     {:ex_doc, "~> 0.11.4", only: :docs},
     {:inch_ex, "~> 0.5", only: :docs},
     {:excoveralls, "~> 0.5", only: :test},
     {:exvcr, "~> 0.6", only: :test},
     {:meck, "~> 0.8", only: :test},
     {:poison, "~> 3.0"} ]
  end

  defp package do
    [ maintainers: ["Leonel Morais"],
      licenses: ["MIT"],
      links: %{ "github" => "https://github.com/lmorais/ex_do" } ]
  end
end
