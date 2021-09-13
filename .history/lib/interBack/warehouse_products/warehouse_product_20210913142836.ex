defmodule InterBack.WarehouseProducts.WarehouseProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "warehouseproducts" do
    field :category, :string
    field :product_name, :string
    field :quantity, :integer

    timestamps()
  end

  @doc false
  def changeset(warehouse_product, attrs) do
    warehouse_product
    |> cast(attrs, [:product_name, :quantity, :category])
    |> validate_required([:product_name, :quantity, :category])
  end
end
