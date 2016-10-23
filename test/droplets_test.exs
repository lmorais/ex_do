defmodule ExDo.DropletsTest do
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use ExUnit.Case, async: false
  import ExDo.Droplets

  @client ExDo.Client.new(%{access_token: "46776a29db50ce8e663c8614cd27c09b963f806a"})

  setup_all do
    HTTPoison.start
  end

  test "find/2" do
    use_cassette "droplets#find" do
      {code, response} = find("12345", @client)
      assert response["id"] == "12345"
    end
  end

  test "find/2 when is not authenticated" do

    use_cassette "droplets#find" do
      {code, response} = find("12345", @client)
      assert response["message"] == "Unable to authenticate you."
    end
  end
end