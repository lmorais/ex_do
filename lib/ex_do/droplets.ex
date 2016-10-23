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
end