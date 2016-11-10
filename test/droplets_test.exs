defmodule ExDo.DropletsTest do
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use ExUnit.Case, async: false
  import ExDo.Droplets

  @client ExDo.Client.new(%{access_token: "864ccaf95a06d56371ad483b80ad43f688b9e"})

  setup_all do
    HTTPoison.start
  end

  test "all/0" do
    use_cassette "droplets#all" do
      response = all(@client)
      assert response == { %{"droplets" => [], "links" => %{}, "meta" => %{"total" => 0} } }
    end    
  end

  test "find/2" do
    use_cassette "droplets#find" do
      response = find("12345", @client)
      assert response == {404, %{"id" => "not_found", "message" => "The resource you were accessing could not be found."}}

    end
  end

  test "create/2" do
    use_cassette "droplets#create" do

      body = %{
        name: "my-droplet",
        region: "nyc3",
        size: "512mb",
        image: "ubuntu-14-04-x64",
        ssh_keys: nil,
        backups: false,
        ipv6: true,
        user_data: nil,
        private_networking: nil,
        volumes: nil
      }

      {status_code, response} = create(@client, body)
      assert response["droplet"]["name"] == "my-droplet"
      assert status_code == 202
    end
  end
end