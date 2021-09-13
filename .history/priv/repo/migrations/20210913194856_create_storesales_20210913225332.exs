defmodule InterBack.Repo.Migrations.CreateStoresales do
  use Ecto.Migration

  def change do
    create table(:storesales) do
      add :storeproduct_id, :integer
      add :quantity, :integer
      add :warehouseproduct_id, :integer
      add :warehouseproduct_id, references(:warehouseproducts, on_delete: :nothing), null: false
      add :store_id, references(:stores, on_delete: :nothing), null: false
      add :user_id, references(:user, on_delete: :nothing), null: false

      timestamps()
    end

  end
end
