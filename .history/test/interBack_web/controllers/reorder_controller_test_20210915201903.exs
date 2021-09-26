defmodule InterBackWeb.ReorderControllerTest do
  use InterBackWeb.ConnCase

  alias InterBack.Reorders
  alias InterBack.Reorders.Reorder

  @create_attrs %{
    processed: true,
    quantity: 42,
    store_id: 42,
    storeproduct_id: 42,
    warehouseproduct_id: 42
  }
  @update_attrs %{
    processed: false,
    quantity: 43,
    store_id: 43,
    storeproduct_id: 43,
    warehouseproduct_id: 43
  }
  @invalid_attrs %{processed: nil, quantity: nil, store_id: nil, storeproduct_id: nil, warehouseproduct_id: nil}

  def fixture(:reorder) do
    {:ok, reorder} = Reorders.create_reorder(@create_attrs)
    reorder
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all reorders", %{conn: conn} do
      conn = get(conn, Routes.reorder_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create reorder" do
    test "renders reorder when data is valid", %{conn: conn} do
      conn = post(conn, Routes.reorder_path(conn, :create), reorder: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.reorder_path(conn, :show, id))

      assert %{
               "id" => id,
               "processed" => true,
               "quantity" => 42,
               "store_id" => 42,
               "storeproduct_id" => 42,
               "warehouseproduct_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.reorder_path(conn, :create), reorder: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update reorder" do
    setup [:create_reorder]

    test "renders reorder when data is valid", %{conn: conn, reorder: %Reorder{id: id} = reorder} do
      conn = put(conn, Routes.reorder_path(conn, :update, reorder), reorder: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.reorder_path(conn, :show, id))

      assert %{
               "id" => id,
               "processed" => false,
               "quantity" => 43,
               "store_id" => 43,
               "storeproduct_id" => 43,
               "warehouseproduct_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, reorder: reorder} do
      conn = put(conn, Routes.reorder_path(conn, :update, reorder), reorder: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete reorder" do
    setup [:create_reorder]

    test "deletes chosen reorder", %{conn: conn, reorder: reorder} do
      conn = delete(conn, Routes.reorder_path(conn, :delete, reorder))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.reorder_path(conn, :show, reorder))
      end
    end
  end

  defp create_reorder(_) do
    reorder = fixture(:reorder)
    %{reorder: reorder}
  end
end
