defmodule ExDo.ClientTest do
  use ExUnit.Case
  import ExDo.Client

  doctest ExDo.Client

  test "the default endpoint" do
    client = new(%{})
    assert client.endpoint == "https://api.digitalocean.com/v2/"
  end

  test "customized endpoint" do
    expected = "https://api.digitalocean.com/v3/"

    client = new(%{}, "https://api.digitalocean.com/v3/")
    assert client.endpoint == expected
  end

end