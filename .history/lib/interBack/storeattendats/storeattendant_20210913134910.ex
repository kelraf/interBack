defmodule InterBack.Storeattendats.Storeattendant do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.{Stores.Store, Accounts.User}

  schema "storeattendants" do
    field :user_id, :integer
    belongs_to(:store, Store)
    belongs_to(:user, User)
    timestamps()
  end

  @doc false
  def changeset(storeattendant, attrs) do
    storeattendant
    |> cast(attrs, [:user_id, :store_id])
    |> validate_required([:user_id, :store_id])
  end
end
