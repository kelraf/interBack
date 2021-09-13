defmodule InterBack.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string
      add :password, :string
      add :name, :string

      timestamps()

    end
    
    create unique_index(:users, [:email])
  end
end
