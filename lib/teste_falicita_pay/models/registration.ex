defmodule TesteFalicitaPay.Models.Registration do
  @moduledoc """
  Registration module.
  """

  import Ecto.Changeset

  use Ecto.Schema

  alias TesteFalicitaPay.Models.Partner

  @required_fields ~w(name cpf email partner_id)a

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :uuid

  schema "registration" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    belongs_to :partner, Partner, type: Ecto.UUID

    timestamps()
  end

  def changeset(%__MODULE__{} = struct, attrs) do
    struct
    |> cast(attrs, [:name, :cpf, :email])
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
  end
end
