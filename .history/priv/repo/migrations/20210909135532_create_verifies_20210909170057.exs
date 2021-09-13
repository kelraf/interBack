defmodule InterBack.Repo.Migrations.CreateVerifies do
  use Ecto.Migration

  def change do
    create table(:verifies) do
      add :code, :integer
      add :verified, :boolean, default: false, null: false
      add :user_id, references(:user, on_delete: :delete_all), null: false
      timestamps()
    end

  end
end
