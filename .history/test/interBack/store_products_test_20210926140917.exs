# defmodule InterBack.StoreProductsTest do
#   use InterBack.DataCase

#   alias InterBack.StoreProducts

#   describe "storeproducts" do
#     alias InterBack.StoreProducts.StoreProduct

#     @valid_attrs %{min_quantity: 42, quantity: 42, store_id: 42, user_id: 42}
#     @update_attrs %{min_quantity: 43, quantity: 43, store_id: 43, user_id: 43}
#     @invalid_attrs %{min_quantity: nil, quantity: nil, store_id: nil, user_id: nil}

#     def store_product_fixture(attrs \\ %{}) do
#       {:ok, store_product} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> StoreProducts.create_store_product()

#       store_product
#     end

#     test "list_storeproducts/0 returns all storeproducts" do
#       store_product = store_product_fixture()
#       assert StoreProducts.list_storeproducts() == [store_product]
#     end

#     test "get_store_product!/1 returns the store_product with given id" do
#       store_product = store_product_fixture()
#       assert StoreProducts.get_store_product!(store_product.id) == store_product
#     end

#     test "create_store_product/1 with valid data creates a store_product" do
#       assert {:ok, %StoreProduct{} = store_product} = StoreProducts.create_store_product(@valid_attrs)
#       assert store_product.min_quantity == 42
#       assert store_product.quantity == 42
#       assert store_product.store_id == 42
#       assert store_product.user_id == 42
#     end

#     test "create_store_product/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = StoreProducts.create_store_product(@invalid_attrs)
#     end

#     test "update_store_product/2 with valid data updates the store_product" do
#       store_product = store_product_fixture()
#       assert {:ok, %StoreProduct{} = store_product} = StoreProducts.update_store_product(store_product, @update_attrs)
#       assert store_product.min_quantity == 43
#       assert store_product.quantity == 43
#       assert store_product.store_id == 43
#       assert store_product.user_id == 43
#     end

#     test "update_store_product/2 with invalid data returns error changeset" do
#       store_product = store_product_fixture()
#       assert {:error, %Ecto.Changeset{}} = StoreProducts.update_store_product(store_product, @invalid_attrs)
#       assert store_product == StoreProducts.get_store_product!(store_product.id)
#     end

#     test "delete_store_product/1 deletes the store_product" do
#       store_product = store_product_fixture()
#       assert {:ok, %StoreProduct{}} = StoreProducts.delete_store_product(store_product)
#       assert_raise Ecto.NoResultsError, fn -> StoreProducts.get_store_product!(store_product.id) end
#     end

#     test "change_store_product/1 returns a store_product changeset" do
#       store_product = store_product_fixture()
#       assert %Ecto.Changeset{} = StoreProducts.change_store_product(store_product)
#     end
#   end
# end
