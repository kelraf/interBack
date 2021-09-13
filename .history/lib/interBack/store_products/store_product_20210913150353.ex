defmodule InterBack.StoreProducts.StoreProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storeproducts" do
    field :min_quantity, :integer
    field :quantity, :integer
    field :store_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(store_product, attrs) do
    store_product
    |> cast(attrs, [:store_id, :quantity, :min_quantity, :user_id])
    |> validate_required([:store_id, :quantity, :min_quantity, :user_id])
  end
end
