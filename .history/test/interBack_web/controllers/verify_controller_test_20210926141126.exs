# defmodule InterBackWeb.VerifyControllerTest do
#   use InterBackWeb.ConnCase

#   alias InterBack.Verification
#   alias InterBack.Verification.Verify

#   @create_attrs %{
#     code: 42,
#     user_id: 42,
#     verified: true
#   }
#   @update_attrs %{
#     code: 43,
#     user_id: 43,
#     verified: false
#   }
#   @invalid_attrs %{code: nil, user_id: nil, verified: nil}

#   def fixture(:verify) do
#     {:ok, verify} = Verification.create_verify(@create_attrs)
#     verify
#   end

#   setup %{conn: conn} do
#     {:ok, conn: put_req_header(conn, "accept", "application/json")}
#   end

#   describe "index" do
#     test "lists all verifies", %{conn: conn} do
#       conn = get(conn, Routes.verify_path(conn, :index))
#       assert json_response(conn, 200)["data"] == []
#     end
#   end

#   describe "create verify" do
#     test "renders verify when data is valid", %{conn: conn} do
#       conn = post(conn, Routes.verify_path(conn, :create), verify: @create_attrs)
#       assert %{"id" => id} = json_response(conn, 201)["data"]

#       conn = get(conn, Routes.verify_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "code" => 42,
#                "user_id" => 42,
#                "verified" => true
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn} do
#       conn = post(conn, Routes.verify_path(conn, :create), verify: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "update verify" do
#     setup [:create_verify]

#     test "renders verify when data is valid", %{conn: conn, verify: %Verify{id: id} = verify} do
#       conn = put(conn, Routes.verify_path(conn, :update, verify), verify: @update_attrs)
#       assert %{"id" => ^id} = json_response(conn, 200)["data"]

#       conn = get(conn, Routes.verify_path(conn, :show, id))

#       assert %{
#                "id" => id,
#                "code" => 43,
#                "user_id" => 43,
#                "verified" => false
#              } = json_response(conn, 200)["data"]
#     end

#     test "renders errors when data is invalid", %{conn: conn, verify: verify} do
#       conn = put(conn, Routes.verify_path(conn, :update, verify), verify: @invalid_attrs)
#       assert json_response(conn, 422)["errors"] != %{}
#     end
#   end

#   describe "delete verify" do
#     setup [:create_verify]

#     test "deletes chosen verify", %{conn: conn, verify: verify} do
#       conn = delete(conn, Routes.verify_path(conn, :delete, verify))
#       assert response(conn, 204)

#       assert_error_sent 404, fn ->
#         get(conn, Routes.verify_path(conn, :show, verify))
#       end
#     end
#   end

#   defp create_verify(_) do
#     verify = fixture(:verify)
#     %{verify: verify}
#   end
# end
