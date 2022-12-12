defmodule Registration do
  @moduledoc """

  """

  import Ecto.Changeset

  use Ecto.Schema


  @required_fields ~w(name cpf email partner_id)a
  @optional_fields ~w()a

  # id (UUID)
  # partner_id (UUID)
  # name (string)
  # cpf (string)
  # email (string)
  # inserted_at (date/time)

  schema "registration" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    belongs_to :partner, Partner

    timestamps()
  end

  def changeset(%__MODULE__{} = struct, attrs) do
    struct
    |> cast(attrs, [:name, :cpf, :email])
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
  end
end
