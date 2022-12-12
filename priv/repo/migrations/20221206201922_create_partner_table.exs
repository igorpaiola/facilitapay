defmodule TesteFalicitaPay.Repo.Migrations.CreatePartnerTable do
  use Ecto.Migration

  def up do
    create table("partner") do
      add :id, :uuid, primary_key: true
      add :name, :string
    end
  end

  def down do
    drop table("partner")
  end

end
