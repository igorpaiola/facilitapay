defmodule Registration do
  @moduledoc """

  """

  use Ecto.Schema

  # id (UUID)
  # partner_id (UUID)
  # name (string)
  # cpf (string)
  # email (string)
  # inserted_at (date/time)

  schema "partner" do
    field :name, String
    field :cpf, String
    field :email, String

    belongs_to :partner, Partner

    timestamps()
  end

  def changeset(%__MODULE__{} = struct, attrs) do
    struct
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

end
