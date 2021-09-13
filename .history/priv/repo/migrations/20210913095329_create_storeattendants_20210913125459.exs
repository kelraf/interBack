defmodule InterBack.Repo.Migrations.CreateStoreattendants do
  use Ecto.Migration

  def change do
    create table(:storeattendants) do
      add :user_id, references(:user, on_delete: :nothing), null: false
      add :store_id, references(:stores, on_delete: :delete_all), null: false

      timestamps()
    end

  end
end
