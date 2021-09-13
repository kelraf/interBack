defmodule InterBack.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.{Storeattendats.Storeattendant, StoreProducts.StoreProduct}

  schema "stores" do
    field :store_name, :string
    field :user_id, :integer

    has_one(:storeattendant, Storeattendant)
    has_many(:storeproducts, StoreProduct)

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:user_id, :store_name])
    |> validate_required([:user_id, :store_name])
  end
end
