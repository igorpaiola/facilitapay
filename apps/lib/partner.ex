defmodule Partner do

  @moduledoc """

  """

  use Ecto.Schema

#   id (UUID)
#   name (string)

  schema "partner" do
    field :name, String
  end

  def changeset(%__MODULE__{} = struct, attrs) do
    struct
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

end
