defmodule Partner do
  @moduledoc """

  """

  import Ecto.Changeset # This is the one that includes cast

  use Ecto.Schema


  @required_fields ~w(name)a
  @optional_fields ~w()a

  schema "partner" do
    field :name, :string

    timestamps()
  end

  def changeset(%__MODULE__{} = struct, attrs) do
    struct
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

end
