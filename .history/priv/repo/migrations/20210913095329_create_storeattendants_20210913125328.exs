defmodule InterBack.Repo.Migrations.CreateStoreattendants do
  use Ecto.Migration

  def change do
    create table(:storeattendants) do
      add :user_id, :integer
      add :store_id, :integer

      timestamps()
    end

  end
end
