defmodule SimpleHttp.Mixfile do
  use Mix.Project

  def project do
    [
      app: :simplehttp,
      version: "0.5.1",
      elixir: "~> 1.4",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      dialyzer: [
        plt_add_deps: :transitive,
        plt_add_apps: [:mix],
        flags: [:race_conditions, :no_opaque]
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :inets]]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.18.0", only: :dev},
      {:cowboy, "~> 1.0.4", only: :test},
      {:plug, ">= 1.2.0", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:credo, "~> 0.10.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp description do
    """
    HTTP client for Elixir without dependencies.
    """
  end

  defp package do
    # These are the default files included in the package
    [
      name: :simplehttp,
      description: "HTTP client for Elixir without dependencies",
      files: ["lib", "config", "mix.exs", "README*"],
      maintainers: ["Bagu Alexandru Bogdan"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/alexandrubagu/simplehttp",
        "Docs" => "https://github.com/alexandrubagu/simplehttp",
        "Website" => "http://www.alexandrubagu.info"
      }
    ]
  end
end
