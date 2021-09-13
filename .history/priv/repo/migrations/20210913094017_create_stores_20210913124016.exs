defmodule InterBack.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :user_id, :integer
      add :store_name, :string

      timestamps()
    end

  end
end
