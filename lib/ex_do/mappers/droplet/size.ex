defmodule ExDo.Mappers.Droplet.Size do
  @derive [ Poison.Encoder ]
  defstruct [:slug, :memory, :vcpus, :disk, :transfer, :price_monthly, :price_hourly, :regions, :available]
end