# defmodule InterBackWeb.StoreattendantControllerTest do
#   use InterBackWeb.ConnCase

#   alias InterBack.Storeattendats
#   alias InterBack.Storeattendats.Storeattendant

#   @create_attrs %{
#     store_id: 42,
#     user_id: 42
#   }
#   @update_attrs %{
#     store_id: 43,
#     user_id: 43
#   }
#   @invalid_attrs %{store_id: nil, user_id: nil}

#   def fixture(:storeattendant) do
#     {:ok, storeattendant} = Storeattendats.create_storeattendant(@create_attrs)
#     storeattendant
#   end

#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end

#   describe "index" do
#     test "lists all storeattendants", %{conn: conn} do
#       conn = get(conn, Routes.storeattendant_path(conn, :index))
#       assert json_response(conn, 200)["data"] == []
#     end
#   end

#   describe "create storeattendant" do
#     test "renders storeattendant when data is valid", %{conn: conn} do
#       conn = post(conn, Routes.storeattendant_path(conn, :create), storeattendant: @create_attrs)
#       assert %{"id" => id} = json_response(conn, 201)["data"]

#       conn = get(conn, Routes.storeattendant_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "store_id" => 42,
#                "user_id" => 42
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn} do
#       conn = post(conn, Routes.storeattendant_path(conn, :create), storeattendant: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "update storeattendant" do
#     setup [:create_storeattendant]

#     test "renders storeattendant when data is valid", %{conn: conn, storeattendant: %Storeattendant{id: id} = storeattendant} do
#       conn = put(conn, Routes.storeattendant_path(conn, :update, storeattendant), storeattendant: @update_attrs)
#       assert %{"id" => ^id} = json_response(conn, 200)["data"]

#       conn = get(conn, Routes.storeattendant_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "store_id" => 43,
#                "user_id" => 43
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn, storeattendant: storeattendant} do
#       conn = put(conn, Routes.storeattendant_path(conn, :update, storeattendant), storeattendant: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "delete storeattendant" do
#     setup [:create_storeattendant]

#     test "deletes chosen storeattendant", %{conn: conn, storeattendant: storeattendant} do
#       conn = delete(conn, Routes.storeattendant_path(conn, :delete, storeattendant))
#       assert response(conn, 204)

#       assert_error_sent 404, fn ->
#         get(conn, Routes.storeattendant_path(conn, :show, storeattendant))
#       end
#     end
#   end

#   defp create_storeattendant(_) do
#     storeattendant = fixture(:storeattendant)
#     %{storeattendant: storeattendant}
#   end
# end
