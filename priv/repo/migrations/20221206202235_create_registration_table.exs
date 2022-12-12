defmodule TesteFalicitaPay.Repo.Migrations.CreateRegistrationTable do
  use Ecto.Migration

  def up do
    create table("registration") do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :cpf, :string
      add :email, :string

      add :partner_id, references(:partner), null: false

      timestamps(inserted_at: :inserted_at)
    end
  end

  def down do
    drop table("registration")
  end

end
