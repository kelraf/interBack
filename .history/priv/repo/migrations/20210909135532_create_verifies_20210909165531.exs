defmodule InterBack.Repo.Migrations.CreateVerifies do
  use Ecto.Migration

  def change do
    create table(:verifies) do
      add :code, :integer
      add :user_id, :integer
      add :verified, :boolean, default: false, null: false

      timestamps()
    end

  end
end
