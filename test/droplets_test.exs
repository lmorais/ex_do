defmodule ExDo.DropletsTest do
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
  use ExUnit.Case, async: false
  import ExDo.Droplets

  @client ExDo.Client.new(%{access_token: "7fb0818dec7f61924c0379960f540e584e1ac11b46117861ac1a8d2197a2f064"})

  setup_all do
    HTTPoison.start
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

  test "create/2 multiple droplets" do
    use_cassette "droplets#create_multiple" do

      body = %{
        names: [
          "my-droplet-1",
          "my-droplet-2"
        ],
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

      {status_code, _} = create(@client, body)
      assert status_code == 202
    end
  end

  test "all/0 when only one droplet exists" do
    use_cassette "droplets#all" do
      response = all(@client)
      assert response != { %{"droplets" => [], "links" => %{}, "meta" => %{"total" => 0} } }
    end    
  end

  test "find/2 when droplet exists" do
    use_cassette "droplets#find_valid" do
      {response} = find("31801457", @client)
      assert response["droplet"]["name"] == "my-droplet" 
    end
  end

  test "find/2 when droplet doesnt exists" do
    use_cassette "droplets#find_invalid" do
      response = find("12345", @client)
      assert response == {404, %{"id" => "not_found", "message" => "The resource you were accessing could not be found."}}
    end
  end

  test "find_by_tag/2" do
    use_cassette "droplets#find_by_tag" do
      {response} = find_by_tag("my-tag", @client)
      assert response["droplets"] == []
    end
  end

  test "destroy/2" do
    use_cassette "droplets#destroy" do
      {status_code, _} = destroy("31801457", @client)
      assert status_code == 204 
    end
  end
end