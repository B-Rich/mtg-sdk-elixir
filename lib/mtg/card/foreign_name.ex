defmodule Mtg.Card.ForeignName do
  @moduledoc """
  Struct defining a card forign name attributes and its types
  """

  defstruct [:flavor, :image_url, :language, :multiverseid, :name, :text]

  @type t :: %__MODULE__{
          flavor: binary(),
          image_url: binary(),
          language: binary(),
          multiverseid: integer(),
          name: binary(),
          text: binary()
        }
end

defimpl Collectable, for: Mtg.Card.ForeignName do
  def into(original) do
    collector_fun = fn
      set, {:cont, {key, value}} -> Map.put(set, key, value)
      set, :done -> set
      _set, :halt -> :ok
    end

    {original, collector_fun}
  end
end
