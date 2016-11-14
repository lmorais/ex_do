defmodule ExDo.Mappers.Droplet.Networks do
  @derive [ Poison.Encoder ]
  defstruct [:v4, :v6]
end