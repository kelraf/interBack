defmodule InterBack.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :name, :string
    field :email, :string
    field :role, :integer
    field :password, Comeonin.Ecto.Password

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :name, :role])
    |> validate_required([:email, :password, :name, :role])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> unique_constraint(:email)
  end

  # defp passwordMinLength(changeset, attrs, value) do

  #   get_field(cha)

  # end
  
end
