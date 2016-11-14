defmodule ExDo.Mappers.Droplet.Region do
  @derive [ Poison.Encoder ]
  defstruct [:name, :slug, :sizes, :features, :available]
end