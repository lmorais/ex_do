defmodule ExDo.Mappers.Droplet.Image do
  @derive [ Poison.Encoder ]
  defstruct [:id, :distribution, :created_at, :min_disk_size, :name, :public, :regions, :slug, :type, :size_gigabytes]
end