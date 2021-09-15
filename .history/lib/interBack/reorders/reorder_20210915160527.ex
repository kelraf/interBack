defmodule InterBack.Reorders.Reorder do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.{WarehouseProducts.WarehouseProduct, StoreProducts.StoreProduct, Repo}

  schema "reorders" do
    field :processed, :boolean, default: false
    field :quantity, :integer, default: 0
    field :store_id, :integer
    belongs_to(:warehouseproduct, WarehouseProduct)
    belongs_to(:storeproduct, StoreProduct)

    timestamps()
  end

  @doc false
  def changeset(reorder, attrs) do
    reorder
    |> cast(attrs, [:store_id, :warehouseproduct_id, :storeproduct_id, :processed, :quantity])
    |> validate_required([:store_id, :warehouseproduct_id, :storeproduct_id, :processed, :quantity])
    |> dispatchProducts()
  end

  defp dispatchProducts(changeset) do
    if changeset.data.id == nil do
      changeset
    else
      data = Repo.preload(changeset.data, [:warehouseproduct, :storeproduct])
      |> IO.inspect
    end
  end
end
