defmodule ExDo.Droplets do
  import ExDo
  alias ExDo.Client

  @doc """
  Get a Droplet
  ## Example
      ExDo.Droplets.find "droplet-id", client
  """
  @spec find(binary, Client.t) :: ExDo.response
  def find(id, client \\ %Client{}) do
    get "droplets/#{id}", client
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
      ExDo.Droplets.create client
  """
  @spec create(Client.t, map) :: ExDo.response
  def create(client \\ %Client{}, body) do
    post "droplets", client, body
  end
end