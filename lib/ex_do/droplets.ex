defmodule ExDo.Droplets do
  import ExDo
  alias ExDo.Client
  alias ExDo.Mappers.Compute
  alias ExDo.Mappers.Droplet
  alias ExDo.Mappers.Droplet.Image
  alias ExDo.Mappers.Droplet.Kernel
  alias ExDo.Mappers.Droplet.Size
  alias ExDo.Mappers.Droplet.Networks
  alias ExDo.Mappers.Droplet.Region
  alias ExDo.Mappers.DropletCreateRequest

  @doc """
  Get a Droplet
  ## Example
      ExDo.Droplets.find "droplet-id", client
  """
  @spec find(binary, Client.t) :: ExDo.response
  def find(id, client \\ %Client{}) do
    response = get "droplets/#{id}", client
    Poison.decode!(response.body, as: %Compute{droplet: %Droplet{image: %Image{}, 
                                                                kernel: %Kernel{},
                                                                size: %Size{},
                                                                networks: %Networks{},
                                                                region: %Region{}}})
  end

  @doc """
  Find a Droplet by tag
  ## Example
      ExDo.Droplets.find_by_tag "my-tag", client
  """
  @spec find(binary, Client.t) :: ExDo.response
  def find_by_tag(tag, client \\ %Client{}) do
    get "droplets?tag_name=#{tag}", client
  end

  @doc """
  List all Droplets
  ## Example
      ExDo.Droplets.all client
  """
  @spec all(Client.t) :: ExDo.response
  def all(client \\ %Client{}) do
    get "droplets", client
  end

  @doc """
  Create a new Droplet
  ## Example
      ExDo.Droplets.create client, payload
  """
  @spec create(Client.t, DropletCreateRequest.t) :: ExDo.response
  def create(client \\ %Client{}, payload \\ %DropletCreateRequest{}) do
    response = post("droplets", client, payload)
    Poison.decode!(response.body, as: %Compute{droplet: %Droplet{image: %Image{}, 
                                                                kernel: %Kernel{},
                                                                size: %Size{},
                                                                networks: %Networks{},
                                                                region: %Region{}}})
  end

  @doc """
  Destroy a Droplet
  ## Example
      ExDo.Droplets.destroy "droplet-id", client
  """
  @spec destroy(binary, Client.t) :: ExDo.response
  def destroy(id, client \\ %Client{}) do
    delete "droplets/#{id}", client
  end
end