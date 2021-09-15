defmodule InterBack.Repo.Migrations.CreateStoresales do
  use Ecto.Migration

  def change do
    create table(:storesales) do
      add :quantity, :integer
      add :storeproduct_id, references(:storeproducts, on_delete: :nothing), null: false
      add :warehouseproduct_id, references(:warehouseproducts, on_delete: :nothing), null: false
      add :store_id, references(:stores, on_delete: :nothing), null: false
      add :user_id, references(:user, on_delete: :nothing), null: false
      imestamps()      

  end
end
