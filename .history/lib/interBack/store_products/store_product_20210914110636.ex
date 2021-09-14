defmodule InterBack.StoreProducts.StoreProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.{Accounts.User, Stores.Store, Repo, WarehouseProducts.WarehouseProduct}

  schema "storeproducts" do
    field :min_quantity, :integer, defaulf: 0
    field :quantity, :integer

    belongs_to(:user, User)
    belongs_to(:store, Store)
    belongs_to(:warehouseproduct, WarehouseProduct)
    timestamps()
  end

  @doc false
  def changeset(store_product, attrs) do
    store_product
    |> cast(attrs, [:store_id, :quantity, :min_quantity, :user_id, :warehouseproduct_id])
    |> validate_required([:store_id, :quantity, :min_quantity, :user_id, :warehouseproduct_id])
  end

  defp validateWarehouseProduct(changeset) do

    warehouseproduct_id = get_field(changeset, :warehouseproduct_id)

    case warehouseproduct_id do
      nil -> changeset
      _ -> 
        warehouseproduct = Repo.get_by(WarehouseProduct, :warehouseproduct_id)

    end
    
  end
end
