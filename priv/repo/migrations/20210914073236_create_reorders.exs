defmodule InterBack.Repo.Migrations.CreateReorders do
  use Ecto.Migration

  def change do
    create table(:reorders) do
      add :store_id, :integer
      add :warehouseproduct_id, :integer
      add :storeproduct_id, :integer
      add :processed, :boolean, default: false, null: false
      add :quantity, :integer

      timestamps()
    end

  end
end
