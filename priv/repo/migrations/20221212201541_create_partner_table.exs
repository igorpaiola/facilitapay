defmodule TesteFalicitaPay.Repo.Migrations.CreatePartnerTable do
  use Ecto.Migration

  def up do
    create table(:partner, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :name, :string

      timestamps()
    end
  end

  def down do
    drop table("partner")
  end
end
