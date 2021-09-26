defmodule InterBack.StoreSalesTest do
  use InterBack.DataCase

  alias InterBack.StoreSales

  describe "storesales" do
    alias InterBack.StoreSales.StoreSale

    @valid_attrs %{quantity: 42, store_id: 42, storeproduct_id: 42, user_id: 42, warehouseproduct_id: 42}
    @update_attrs %{quantity: 43, store_id: 43, storeproduct_id: 43, user_id: 43, warehouseproduct_id: 43}
    @invalid_attrs %{quantity: nil, store_id: nil, storeproduct_id: nil, user_id: nil, warehouseproduct_id: nil}

    def store_sale_fixture(attrs \\ %{}) do
      {:ok, store_sale} =
        attrs
        |> Enum.into(@valid_attrs)
        |> StoreSales.create_store_sale()

      store_sale
    end

    test "list_storesales/0 returns all storesales" do
      store_sale = store_sale_fixture()
      assert StoreSales.list_storesales() == [store_sale]
    end

    test "get_store_sale!/1 returns the store_sale with given id" do
      store_sale = store_sale_fixture()
      assert StoreSales.get_store_sale!(store_sale.id) == store_sale
    end

    test "create_store_sale/1 with valid data creates a store_sale" do
      assert {:ok, %StoreSale{} = store_sale} = StoreSales.create_store_sale(@valid_attrs)
      assert store_sale.quantity == 42
      assert store_sale.store_id == 42
      assert store_sale.storeproduct_id == 42
      assert store_sale.user_id == 42
      assert store_sale.warehouseproduct_id == 42
    end

    test "create_store_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = StoreSales.create_store_sale(@invalid_attrs)
    end

    test "update_store_sale/2 with valid data updates the store_sale" do
      store_sale = store_sale_fixture()
      assert {:ok, %StoreSale{} = store_sale} = StoreSales.update_store_sale(store_sale, @update_attrs)
      assert store_sale.quantity == 43
      assert store_sale.store_id == 43
      assert store_sale.storeproduct_id == 43
      assert store_sale.user_id == 43
      assert store_sale.warehouseproduct_id == 43
    end

    test "update_store_sale/2 with invalid data returns error changeset" do
      store_sale = store_sale_fixture()
      assert {:error, %Ecto.Changeset{}} = StoreSales.update_store_sale(store_sale, @invalid_attrs)
      assert store_sale == StoreSales.get_store_sale!(store_sale.id)
    end

    test "delete_store_sale/1 deletes the store_sale" do
      store_sale = store_sale_fixture()
      assert {:ok, %StoreSale{}} = StoreSales.delete_store_sale(store_sale)
      assert_raise Ecto.NoResultsError, fn -> StoreSales.get_store_sale!(store_sale.id) end
    end

    test "change_store_sale/1 returns a store_sale changeset" do
      store_sale = store_sale_fixture()
      assert %Ecto.Changeset{} = StoreSales.change_store_sale(store_sale)
    end
  end
end
