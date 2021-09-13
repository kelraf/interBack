defmodule InterBack.Repo.Migrations.CreateStoreproducts do
  use Ecto.Migration

  def change do
    create table(:storeproducts) do
      add :store_id, :integer
      add :quantity, :integer
      add :min_quantity, :integer
      add :user_id, :integer

      timestamps()
    end

  end
end
