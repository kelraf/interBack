defmodule InterBack.Repo.Migrations.CreateStoreproducts do
  use Ecto.Migration

  def change do
    create table(:storeproducts) do
      add :store_id, references(:stores, on_delete: :delete_all), null: false
      add :quantity, :integer
      add :min_quantity, :integer
      add :user_id, references(:user, on_delete: :nothing), null: false
      add :warehouseproduct_id, references(:user, on_delete: :delete_all)

      timestamps()
    end

  end
end
