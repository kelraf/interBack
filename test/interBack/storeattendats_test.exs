defmodule InterBack.StoreattendatsTest do
  use InterBack.DataCase

  alias InterBack.Storeattendats

  describe "storeattendants" do
    alias InterBack.Storeattendats.Storeattendant

    @valid_attrs %{store_id: 42, user_id: 42}
    @update_attrs %{store_id: 43, user_id: 43}
    @invalid_attrs %{store_id: nil, user_id: nil}

    def storeattendant_fixture(attrs \\ %{}) do
      {:ok, storeattendant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Storeattendats.create_storeattendant()

      storeattendant
    end

    test "list_storeattendants/0 returns all storeattendants" do
      storeattendant = storeattendant_fixture()
      assert Storeattendats.list_storeattendants() == [storeattendant]
    end

    test "get_storeattendant!/1 returns the storeattendant with given id" do
      storeattendant = storeattendant_fixture()
      assert Storeattendats.get_storeattendant!(storeattendant.id) == storeattendant
    end

    test "create_storeattendant/1 with valid data creates a storeattendant" do
      assert {:ok, %Storeattendant{} = storeattendant} = Storeattendats.create_storeattendant(@valid_attrs)
      assert storeattendant.store_id == 42
      assert storeattendant.user_id == 42
    end

    test "create_storeattendant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Storeattendats.create_storeattendant(@invalid_attrs)
    end

    test "update_storeattendant/2 with valid data updates the storeattendant" do
      storeattendant = storeattendant_fixture()
      assert {:ok, %Storeattendant{} = storeattendant} = Storeattendats.update_storeattendant(storeattendant, @update_attrs)
      assert storeattendant.store_id == 43
      assert storeattendant.user_id == 43
    end

    test "update_storeattendant/2 with invalid data returns error changeset" do
      storeattendant = storeattendant_fixture()
      assert {:error, %Ecto.Changeset{}} = Storeattendats.update_storeattendant(storeattendant, @invalid_attrs)
      assert storeattendant == Storeattendats.get_storeattendant!(storeattendant.id)
    end

    test "delete_storeattendant/1 deletes the storeattendant" do
      storeattendant = storeattendant_fixture()
      assert {:ok, %Storeattendant{}} = Storeattendats.delete_storeattendant(storeattendant)
      assert_raise Ecto.NoResultsError, fn -> Storeattendats.get_storeattendant!(storeattendant.id) end
    end

    test "change_storeattendant/1 returns a storeattendant changeset" do
      storeattendant = storeattendant_fixture()
      assert %Ecto.Changeset{} = Storeattendats.change_storeattendant(storeattendant)
    end
  end
end
