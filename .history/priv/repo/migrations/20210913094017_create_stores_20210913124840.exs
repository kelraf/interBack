defmodule InterBack.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :store_name, :string

      add :user_id, references(:user, on_delete: :nothing), null: false
      timestamps()
    end

  end
end
