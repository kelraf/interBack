defmodule InterBack.Repo.Migrations.CreateWarehouseproducts do
  use Ecto.Migration

  def change do
    create table(:warehouseproducts) do
      add :product_name, :string
      add :quantity, :integer
      add :category, :string

      timestamps()
    end

  end
end
