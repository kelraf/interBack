defmodule InterBack.Verification.Verify do
  use Ecto.Schema
  import Ecto.Changeset

  schema "verifies" do
    field :code, :integer
    field :user_id, :integer
    field :verified, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(verify, attrs) do
    verify
    |> cast(attrs, [:code, :user_id, :verified])
    |> validate_required([:code, :user_id, :verified])
  end
end
