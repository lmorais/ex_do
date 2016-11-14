defmodule ExDo.Mappers.Droplet.Kernel do
  @derive [ Poison.Encoder ]
  defstruct [:id, :name, :version]
end