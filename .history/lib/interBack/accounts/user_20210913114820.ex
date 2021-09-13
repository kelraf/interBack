defmodule InterBack.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias InterBack.Repo

  schema "user" do
    field :name, :string
    field :email, :string
    field :role, :integer
    field :password_confirmation, :string, virtual: true
    # field :password, Comeonin.Ecto.Password
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :name, :role, :password_confirmation])
    |> validate_required([:email, :password, :name, :role, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validatePasswords()
    |> validateRole()
    |> unique_constraint(:email)
  end

  # defp passwordMinLength(changeset, attrs, value) do

  #   get_field(cha)

  # end

  defp validateRole(changeset) do
    IO.inspect __MODULE__
    case get_field(changeset, :role) do
      nil -> 
        changeset
      1 -> 
        if Repo.get_by(__MODULE__, role: 1) == nil do
          changeset
        else
          add_error(changeset, :role, "invalid role")
        end
      _ ->
        changeset
    end
  end

  defp validatePasswords(changeset) do
    if get_field(changeset, :password) != get_field(changeset, :password_confirmation)  do
      add_error(changeset, :password_confirmation, "Passwords must match")
    else
      changeset
    end
  end
  
end
