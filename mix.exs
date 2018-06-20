defmodule Testcuttlefish.Mixfile do
  use Mix.Project

  def project do
    [app: :testcuttlefish,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
       {:goldrush, "~>0.1.8", 
          [env: :prod, repo: "hexpm", hex: "goldrush", manager: :rebar3, override: true]},
       {:riak_sysmon,
            git: "git://github.com/freeakdb/riak_sysmon.git",
            branch: "develop-2.2",
	  override: true,
          manager: :rebar,
          runtime: false},
       {:lager, "3.0.2",
          [env: :prod, repo: "hexpm", hex: "lager", manager: :rebar3, override: true]},
       {:cuttlefish,
         git: "git://github.com/freeakdb/cuttlefish.git",
         tag: "freeakdb-1.1",
         override: true}
    ]
  end
end
