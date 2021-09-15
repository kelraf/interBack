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
    
    case get_field(changeset, :storeproduct_id) do
      nil -> changeset
      storeproduct_id -> 
        store_product = Repo.get_by(StoreProduct, id: storeproduct_id)

      _ ->
        add_error(changeset, :storeproduct_id, "Oops an error occured")

    end

  end
end
