defmodule InterBack.Repo.Migrations.CreateWarehouseproducts do
  use Ecto.Migration

  def change do
    create table(:warehouseproducts) do
      add :product_name, :string
      add :quantity, :integer
      add :category, :string
      add :user_id, references(:user, on_delete: :nothing), null: false

      timestamps()
    end

  end
end
