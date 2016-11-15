defmodule ExDo.Mappers.DropletCreateRequest do
  @derive [ Poison.Encoder ]
  defstruct [:name, :region, :size, :image, :ssh_keys, :backups, :ipv6, :private_networking, :user_data, :volumes]
end