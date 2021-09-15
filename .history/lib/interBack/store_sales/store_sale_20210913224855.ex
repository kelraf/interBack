defmodule InterBack.StoreSales.StoreSale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storesales" do
    field :quantity, :integer
    field :store_id, :integer
    field :storeproduct_id, :integer
    field :user_id, :integer
    field :warehouseproduct_id, :integer

    timestamps()
  end

  @doc false
  def changeset(store_sale, attrs) do
    store_sale
    |> cast(attrs, [:storeproduct_id, :quantity, :warehouseproduct_id, :store_id, :user_id])
    |> validate_required([:storeproduct_id, :quantity, :warehouseproduct_id, :store_id, :user_id])
  end
end
