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
    |> validateWarehouseProduct()
  end

  defp validateWarehouseProduct(changeset) do

    warehouseproduct_id = get_field(changeset, :warehouseproduct_id)
    quantity = get_field(changeset, :quantity)

    case warehouseproduct_id do
      nil -> changeset
      _ -> 
        warehouseproduct = Repo.get_by(WarehouseProduct, id: warehouseproduct_id)

        case warehouseproduct do
          nil -> add_error(changeset, :warehouseproduct_id, "The warehouse product does not exist")

          %WarehouseProduct{} = warehouseproduct ->

            warehouse_product_quantity = Map.get(warehouseproduct, :quantity);
            
            cond do
              quantity == nil -> changeset
              warehouse_product_quantity < quantity -> add_error(changeset, :quantity, "Quantity Exceeds the available products in warehouse")
              true ->
                new_warehouseproduct = 
                  warehouseproduct
                  |> Map.from_struct
                  |> Map.drop([:__meta__, :user])
                  |> Map.put(:quantity, warehouse_product_quantity - quantity)
            end

          _ -> add_error(changeset, :warehouseproduct_id, "Ooops an error occured")
        end

    end
    
  end
end
