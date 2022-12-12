defmodule TesteFalicitaPay.Repo.Migrations.CreateRegistrationTable do
  use Ecto.Migration

  def up do
    create table(:registration, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :name, :string
      add :cpf, :string
      add :email, :string

      add :partner_id, references(:partner, type: :uuid, on_delete: :delete_all), null: false

      timestamps()
    end
  end

  def down do
    drop table("registration")
  end
end
