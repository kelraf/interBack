defmodule InterBack.StoreSales.StoreSale do
  use Ecto.Schema
  import Ecto.Changeset

  alias InterBack.{Repo, StoreProducts.StoreProduct, Reorders.Reorder, WarehouseProducts.WarehouseProduct}

  schema "storesales" do
    field :quantity, :integer
    field :store_id, :integer
    field :storeproduct_id, :integer
    field :user_id, :integer
    field :store_product_changeset, :map, virtual: true

    belongs_to(:warehouseproduct, WarehouseProduct)

    timestamps()
  end

  @doc false
  def changeset(store_sale, attrs) do
    store_sale
    |> cast(attrs, [:storeproduct_id, :quantity, :warehouseproduct_id, :store_id, :user_id])
    |> validate_required([:storeproduct_id, :quantity, :warehouseproduct_id, :store_id, :user_id])
    |> noZeroQuantity
    |> calcSale
  end

  defp noZeroQuantity(changeset) do

    case get_field(changeset, :quantity) do
      nil ->
        changeset
      0 ->
        add_error(changeset, :quantity, "Ooops Quantity can't be zero")
      _ -> changeset
    end
    
  end

  defp calcSale(changeset) do
    sale_quantity = get_field(changeset, :quantity)
    storeproduct_id = get_field(changeset, :storeproduct_id)

    if sale_quantity == nil do
      changeset
    else
      if storeproduct_id == nil do
        changeset
      else
        storeproduct = Repo.get_by(StoreProduct, id: storeproduct_id)
        cond do
          storeproduct == nil -> add_error(changeset, :storeproduct_id, "The store product does not exist")
          sale_quantity > Map.get(storeproduct, :quantity) -> add_error(changeset, :quantity, "Quantity Exceeds the available products in store")
          true ->

            s_changeset = 
              storeproduct 
              |> StoreProduct.changeset(%{quantity: Map.get(storeproduct, :quantity) - sale_quantity}) 
              |> delete_change(:new_warehouseproduct_changeset)

            if (Map.get(storeproduct, :quantity) - sale_quantity) <= Map.get(storeproduct, :min_quantity) do

              r_changeset = 
                %Reorder{}
                |> Reorder.changeset(%{
                  store_id: Map.get(storeproduct, :store_id),
                  warehouseproduct_id: Map.get(storeproduct, :warehouseproduct_id),
                  storeproduct_id: Map.get(storeproduct, :id)
                })

              changeset 
              |> put_change(:store_product_changeset, %{s_changeset: s_changeset, r_changeset: r_changeset})
              # |> put_change(:warehouseproduct_id, storeproduct)
            else
              changeset |> put_change(:store_product_changeset, %{s_changeset: s_changeset})
            end
            
        end
      end
    end

  end
 
end
