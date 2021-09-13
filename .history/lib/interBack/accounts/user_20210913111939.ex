defmodule InterBack.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.Repo

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
    |> validateRole()
    |> unique_constraint(:email)
  end

  # defp passwordMinLength(changeset, attrs, value) do

  #   get_field(cha)

  # end

  defp validateRole(changeset) do
    case get_field(changeset, :role) do
      nil -> 
        changeset
      1 -> 
        case Repo.get_by(changeset, :role, 1) do
          nil -> changeset
          user -> add_error(changeset, :role, "invalid role")
            
        end
      _ ->
        changeset
    end
  end
  
end
