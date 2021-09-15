defmodule InterBack.StoreSales.StoreSale do
  use Ecto.Schema
  import Ecto.Changeset

  alias InterBack.{Repo, StoreProducts.StoreProduct}

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
    |> noZeroQuantity
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
                        
        end
      end
    end

  end
end
