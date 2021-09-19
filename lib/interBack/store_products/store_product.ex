defmodule InterBack.StoreProducts.StoreProduct do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]
  alias InterBack.{Accounts.User, Stores.Store, Repo, WarehouseProducts.WarehouseProduct, Reorders.Reorder}

  schema "storeproducts" do
    field :min_quantity, :integer, defaulf: 0
    field :quantity, :integer
    field :new_warehouseproduct_changeset, :map, virtual: true

    belongs_to(:user, User)
    belongs_to(:store, Store)
    belongs_to(:warehouseproduct, WarehouseProduct)
    has_many(:reorders, Reorder, foreign_key: :storeproduct_id)
    timestamps()
  end

  @doc false
  def changeset(store_product, attrs, update \\ false) do
    store_product
    |> cast(attrs, [:store_id, :quantity, :min_quantity, :user_id, :warehouseproduct_id])
    |> validate_required([:store_id, :quantity, :min_quantity, :user_id, :warehouseproduct_id])
    |> validateQuantity
    |> checkProductExistInStore()
    |> innitialDispatchProduct(update)
  end

  defp validateQuantity(changeset) do

    min_quantity = get_field(changeset, :min_quantity)
    quantity = get_field(changeset, :quantity)

    cond do
      min_quantity == nil -> changeset
      quantity == nil -> changeset
      min_quantity > quantity -> add_error(changeset, :quantity, "Quantity must be equal or greater than Min Quantity")
      true -> changeset
    end

  end

  defp checkProductExistInStore(changeset) do
    warehouse_product_id = get_field(changeset, :warehouseproduct_id)
    store_id = get_field(changeset, :store_id)

    cond do
      warehouse_product_id == nil -> changeset
      store_id == nil -> changeset
      changeset.data.id !== nil -> changeset
      true ->
        storeproducts = Repo.all(from s_p in __MODULE__, where: s_p.store_id == ^store_id and s_p.warehouseproduct_id == ^warehouse_product_id, select: s_p)
        if Enum.empty?(storeproducts) do
          changeset
        else
          add_error(changeset, :store_id, "The Product Exist In Store")
        end
    end

  end

  defp innitialDispatchProduct(changeset, _update) do

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
                w_changeset = 
                  warehouseproduct
                  |> WarehouseProduct.changeset(%{quantity: warehouse_product_quantity - quantity})

                  changeset
                  |> put_change(:new_warehouseproduct_changeset, %{w_changeset: w_changeset})
            end

          _ -> add_error(changeset, :warehouseproduct_id, "Ooops an error occured")
        end

    end
    
  end
end
