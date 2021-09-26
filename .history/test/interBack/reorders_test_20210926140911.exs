# defmodule InterBack.ReordersTest do
#   use InterBack.DataCase

#   alias InterBack.Reorders

#   describe "reorders" do
#     alias InterBack.Reorders.Reorder

#     @valid_attrs %{processed: true, quantity: 42, store_id: 42, storeproduct_id: 42, warehouseproduct_id: 42}
#     @update_attrs %{processed: false, quantity: 43, store_id: 43, storeproduct_id: 43, warehouseproduct_id: 43}
#     @invalid_attrs %{processed: nil, quantity: nil, store_id: nil, storeproduct_id: nil, warehouseproduct_id: nil}

#     def reorder_fixture(attrs \\ %{}) do
#       {:ok, reorder} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Reorders.create_reorder()

#       reorder
#     end

#     test "list_reorders/0 returns all reorders" do
#       reorder = reorder_fixture()
#       assert Reorders.list_reorders() == [reorder]
#     end

#     test "get_reorder!/1 returns the reorder with given id" do
#       reorder = reorder_fixture()
#       assert Reorders.get_reorder!(reorder.id) == reorder
#     end

#     test "create_reorder/1 with valid data creates a reorder" do
#       assert {:ok, %Reorder{} = reorder} = Reorders.create_reorder(@valid_attrs)
#       assert reorder.processed == true
#       assert reorder.quantity == 42
#       assert reorder.store_id == 42
#       assert reorder.storeproduct_id == 42
#       assert reorder.warehouseproduct_id == 42
#     end

#     test "create_reorder/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Reorders.create_reorder(@invalid_attrs)
#     end

#     test "update_reorder/2 with valid data updates the reorder" do
#       reorder = reorder_fixture()
#       assert {:ok, %Reorder{} = reorder} = Reorders.update_reorder(reorder, @update_attrs)
#       assert reorder.processed == false
#       assert reorder.quantity == 43
#       assert reorder.store_id == 43
#       assert reorder.storeproduct_id == 43
#       assert reorder.warehouseproduct_id == 43
#     end

#     test "update_reorder/2 with invalid data returns error changeset" do
#       reorder = reorder_fixture()
#       assert {:error, %Ecto.Changeset{}} = Reorders.update_reorder(reorder, @invalid_attrs)
#       assert reorder == Reorders.get_reorder!(reorder.id)
#     end

#     test "delete_reorder/1 deletes the reorder" do
#       reorder = reorder_fixture()
#       assert {:ok, %Reorder{}} = Reorders.delete_reorder(reorder)
#       assert_raise Ecto.NoResultsError, fn -> Reorders.get_reorder!(reorder.id) end
#     end

#     test "change_reorder/1 returns a reorder changeset" do
#       reorder = reorder_fixture()
#       assert %Ecto.Changeset{} = Reorders.change_reorder(reorder)
#     end
#   end
# end
