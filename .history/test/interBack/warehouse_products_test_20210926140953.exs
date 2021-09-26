# defmodule InterBack.WarehouseProductsTest do
#   use InterBack.DataCase

#   alias InterBack.WarehouseProducts

#   describe "warehouseproducts" do
#     alias InterBack.WarehouseProducts.WarehouseProduct

#     @valid_attrs %{category: "some category", product_name: "some product_name", quantity: 42}
#     @update_attrs %{category: "some updated category", product_name: "some updated product_name", quantity: 43}
#     @invalid_attrs %{category: nil, product_name: nil, quantity: nil}

#     def warehouse_product_fixture(attrs \\ %{}) do
#       {:ok, warehouse_product} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> WarehouseProducts.create_warehouse_product()

#       warehouse_product
#     end

#     test "list_warehouseproducts/0 returns all warehouseproducts" do
#       warehouse_product = warehouse_product_fixture()
#       assert WarehouseProducts.list_warehouseproducts() == [warehouse_product]
#     end

#     test "get_warehouse_product!/1 returns the warehouse_product with given id" do
#       warehouse_product = warehouse_product_fixture()
#       assert WarehouseProducts.get_warehouse_product!(warehouse_product.id) == warehouse_product
#     end

#     test "create_warehouse_product/1 with valid data creates a warehouse_product" do
#       assert {:ok, %WarehouseProduct{} = warehouse_product} = WarehouseProducts.create_warehouse_product(@valid_attrs)
#       assert warehouse_product.category == "some category"
#       assert warehouse_product.product_name == "some product_name"
#       assert warehouse_product.quantity == 42
#     end

#     test "create_warehouse_product/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = WarehouseProducts.create_warehouse_product(@invalid_attrs)
#     end

#     test "update_warehouse_product/2 with valid data updates the warehouse_product" do
#       warehouse_product = warehouse_product_fixture()
#       assert {:ok, %WarehouseProduct{} = warehouse_product} = WarehouseProducts.update_warehouse_product(warehouse_product, @update_attrs)
#       assert warehouse_product.category == "some updated category"
#       assert warehouse_product.product_name == "some updated product_name"
#       assert warehouse_product.quantity == 43
#     end

#     test "update_warehouse_product/2 with invalid data returns error changeset" do
#       warehouse_product = warehouse_product_fixture()
#       assert {:error, %Ecto.Changeset{}} = WarehouseProducts.update_warehouse_product(warehouse_product, @invalid_attrs)
#       assert warehouse_product == WarehouseProducts.get_warehouse_product!(warehouse_product.id)
#     end

#     test "delete_warehouse_product/1 deletes the warehouse_product" do
#       warehouse_product = warehouse_product_fixture()
#       assert {:ok, %WarehouseProduct{}} = WarehouseProducts.delete_warehouse_product(warehouse_product)
#       assert_raise Ecto.NoResultsError, fn -> WarehouseProducts.get_warehouse_product!(warehouse_product.id) end
#     end

#     test "change_warehouse_product/1 returns a warehouse_product changeset" do
#       warehouse_product = warehouse_product_fixture()
#       assert %Ecto.Changeset{} = WarehouseProducts.change_warehouse_product(warehouse_product)
#     end
#   end
# end
