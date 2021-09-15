defmodule InterBack.WarehouseProducts.WarehouseProduct do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.{Accounts.User, Reorders.Reorder}

  schema "warehouseproducts" do
    field :category, :string
    field :product_name, :string
    field :quantity, :integer

    belongs_to(:user, User)
    has_many(:reorders, Reorder, foreign_key: :warehouseproduct_id)

    timestamps()
  end

  @doc false
  def changeset(warehouse_product, attrs) do
    warehouse_product
    |> cast(attrs, [:product_name, :quantity, :category, :user_id])
    |> validate_required([:product_name, :quantity, :category, :user_id])
  end
end
