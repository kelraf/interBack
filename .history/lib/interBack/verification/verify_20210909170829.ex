defmodule InterBack.Verification.Verify do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.Accounts.User

  schema "verifies" do
    field :code, :integer
    field :verified, :boolean, default: false
    belongs_to(:user, User)
    timestamps()
  end

  @doc false
  def changeset(verify, attrs) do
    verify
    |> cast(attrs, [:code, :user_id, :verified])
    |> validate_required([:code, :user_id, :verified])
  end
end
