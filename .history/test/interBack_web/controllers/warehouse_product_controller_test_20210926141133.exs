# defmodule InterBackWeb.WarehouseProductControllerTest do
#   use InterBackWeb.ConnCase

#   alias InterBack.WarehouseProducts
#   alias InterBack.WarehouseProducts.WarehouseProduct

#   @create_attrs %{
#     category: "some category",
#     product_name: "some product_name",
#     quantity: 42
#   }
#   @update_attrs %{
#     category: "some updated category",
#     product_name: "some updated product_name",
#     quantity: 43
#   }
#   @invalid_attrs %{category: nil, product_name: nil, quantity: nil}

#   def fixture(:warehouse_product) do
#     {:ok, warehouse_product} = WarehouseProducts.create_warehouse_product(@create_attrs)
#     warehouse_product
#   end
# #
#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end

#   describe "index" do
#     test "lists all warehouseproducts", %{conn: conn} do
#       conn = get(conn, Routes.warehouse_product_path(conn, :index))
#       assert json_response(conn, 200)["data"] == []
#     end
#   end

#   describe "create warehouse_product" do
#     test "renders warehouse_product when data is valid", %{conn: conn} do
#       conn = post(conn, Routes.warehouse_product_path(conn, :create), warehouse_product: @create_attrs)
#       assert %{"id" => id} = json_response(conn, 201)["data"]

#       conn = get(conn, Routes.warehouse_product_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "category" => "some category",
#                "product_name" => "some product_name",
#                "quantity" => 42
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn} do
#       conn = post(conn, Routes.warehouse_product_path(conn, :create), warehouse_product: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "update warehouse_product" do
#     setup [:create_warehouse_product]

#     test "renders warehouse_product when data is valid", %{conn: conn, warehouse_product: %WarehouseProduct{id: id} = warehouse_product} do
#       conn = put(conn, Routes.warehouse_product_path(conn, :update, warehouse_product), warehouse_product: @update_attrs)
#       assert %{"id" => ^id} = json_response(conn, 200)["data"]

#       conn = get(conn, Routes.warehouse_product_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "category" => "some updated category",
#                "product_name" => "some updated product_name",
#                "quantity" => 43
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn, warehouse_product: warehouse_product} do
#       conn = put(conn, Routes.warehouse_product_path(conn, :update, warehouse_product), warehouse_product: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "delete warehouse_product" do
#     setup [:create_warehouse_product]

#     test "deletes chosen warehouse_product", %{conn: conn, warehouse_product: warehouse_product} do
#       conn = delete(conn, Routes.warehouse_product_path(conn, :delete, warehouse_product))
#       assert response(conn, 204)

#       assert_error_sent 404, fn ->
#         get(conn, Routes.warehouse_product_path(conn, :show, warehouse_product))
#       end
#     end
#   end

#   defp create_warehouse_product(_) do
#     warehouse_product = fixture(:warehouse_product)
#     %{warehouse_product: warehouse_product}
#   end
# end
