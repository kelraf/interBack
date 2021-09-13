defmodule InterBack.Repo.Migrations.CreateStoresales do
  use Ecto.Migration

  def change do
    create table(:storesales) do
      add :storeproduct_id, :integer
      add :quantity, :integer
      add :warehouseproduct_id, :integer
      add :store_id, :integer
      add :user_id, :integer

      timestamps()
    end

  end
end
