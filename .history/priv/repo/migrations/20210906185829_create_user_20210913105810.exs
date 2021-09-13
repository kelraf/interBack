defmodule InterBack.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :email, :string
      add :password, :string
      add :name, :string
      add :role, :integer

      timestamps()

    end
    
    create unique_index(:user, [:email])
  end
end
