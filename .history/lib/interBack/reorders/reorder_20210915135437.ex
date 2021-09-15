defmodule InterBack.Reorders.Reorder do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reorders" do
    field :processed, :boolean, default: false
    field :quantity, :integer, default: 0
    field :store_id, :integer
    field :storeproduct_id, :integer
    field :warehouseproduct_id, :integer

    timestamps()
  end

  @doc false
  def changeset(reorder, attrs) do
    reorder
    |> cast(attrs, [:store_id, :warehouseproduct_id, :storeproduct_id, :processed, :quantity])
    |> validate_required([:store_id, :warehouseproduct_id, :storeproduct_id, :processed, :quantity])
  end
end
