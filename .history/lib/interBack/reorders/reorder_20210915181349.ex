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

      if data.warehouseproduct != nil && data.storeproduct != nil do

        quantity = get_field(changeset, :quantity)

        if quantity == nil do

          changeset

        else

          cond do
            quantity > data.warehouseproduct.quantity -> add_error(changeset, :quantity, "The quantity requested exceeds the available products in the warehouse")
            data.processed -> add_error(changeset, :processed, "Oops!!! Reorder has been processed")
            true -> 
              w_p_changeset = WarehouseProduct.changeset(data.warehouseproduct, %{quantity: (data.warehouseproduct.quantity - quantity)})
              s_p_changeset = StoreProduct.changeset(data.storeproduct, %{quantity: (data.storeproduct.quantity + quantity)})
              put_change(changeset, :changesets, %{w_p_changeset: w_p_changeset, s_p_changeset: s_p_changeset})  |> IO.inspect          
          end

        end

      else
        add_error(changeset, :quantity, "Oops an error occured")
      end

    end

  end
end
