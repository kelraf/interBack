defmodule InterBack.Storeattendats.Storeattendant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "storeattendants" do
    field :store_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(storeattendant, attrs) do
    storeattendant
    |> cast(attrs, [:user_id, :store_id])
    |> validate_required([:user_id, :store_id])
  end
end
