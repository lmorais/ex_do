defmodule ExDo.Mappers.Droplet do
  @derive [ Poison.Encoder ]
  defstruct [
  				:id, :name, :memory, :vcpus, :disk, :locked, :status, :kernel, 
  				:features, :backup_ids, :next_backup_window, :snapshot_ids, :image,
  				:volume_ids, :size, :networks, :region, :size_slug, :tags, :created_at
  			]
end