defmodule InterBack.StoreProducts.StoreProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.{Accounts.User, Stores.Store, WarehouseProducts.WarehouseProduct}

  schema "storeproducts" do
    field :min_quantity, :integer
    field :quantity, :integer

    belongs_to(:user, User)
    belongs_to(:store, Store)
    belongs_to(:warehouse_product, WarehouseProduct)
    timestamps()
  end

  @doc false
  def changeset(store_product, attrs) do
    store_product
    |> cast(attrs, [:store_id, :quantity, :min_quantity, :user_id])
    |> validate_required([:store_id, :quantity, :min_quantity, :user_id])
  end
end
