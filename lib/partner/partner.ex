defmodule Partner do
  @moduledoc """

  """

  import Ecto.Changeset

  use Ecto.Schema

  @required_fields ~w(name)a

  @primary_key {:id, Ecto.UUID, autogenerate: true}

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
