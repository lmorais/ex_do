# ExDO

### A Simple wrapper for Digital Ocean API

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `ex_do` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ex_do, "~> 0.1.0"}]
    end
    ```

  2. Ensure `ex_do` is started before your application:

    ```elixir
    def application do
      [applications: [:ex_do]]
    end
    ```