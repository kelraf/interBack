defmodule InterBackWeb.StoreSaleControllerTest do
  use InterBackWeb.ConnCase

  alias InterBack.StoreSales
  alias InterBack.StoreSales.StoreSale

  @create_attrs %{
    quantity: 42,
    store_id: 42,
    storeproduct_id: 42,
    user_id: 42,
    warehouseproduct_id: 42
  }
  @update_attrs %{
    quantity: 43,
    store_id: 43,
    storeproduct_id: 43,
    user_id: 43,
    warehouseproduct_id: 43
  }
  @invalid_attrs %{quantity: nil, store_id: nil, storeproduct_id: nil, user_id: nil, warehouseproduct_id: nil}

  def fixture(:store_sale) do
    {:ok, store_sale} = StoreSales.create_store_sale(@create_attrs)
    store_sale
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all storesales", %{conn: conn} do
      conn = get(conn, Routes.store_sale_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create store_sale" do
    test "renders store_sale when data is valid", %{conn: conn} do
      conn = post(conn, Routes.store_sale_path(conn, :create), store_sale: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.store_sale_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 42,
               "store_id" => 42,
               "storeproduct_id" => 42,
               "user_id" => 42,
               "warehouseproduct_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.store_sale_path(conn, :create), store_sale: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update store_sale" do
    setup [:create_store_sale]

    test "renders store_sale when data is valid", %{conn: conn, store_sale: %StoreSale{id: id} = store_sale} do
      conn = put(conn, Routes.store_sale_path(conn, :update, store_sale), store_sale: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.store_sale_path(conn, :show, id))

      assert %{
               "id" => id,
               "quantity" => 43,
               "store_id" => 43,
               "storeproduct_id" => 43,
               "user_id" => 43,
               "warehouseproduct_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, store_sale: store_sale} do
      conn = put(conn, Routes.store_sale_path(conn, :update, store_sale), store_sale: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete store_sale" do
    setup [:create_store_sale]

    test "deletes chosen store_sale", %{conn: conn, store_sale: store_sale} do
      conn = delete(conn, Routes.store_sale_path(conn, :delete, store_sale))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.store_sale_path(conn, :show, store_sale))
      end
    end
  end

  defp create_store_sale(_) do
    store_sale = fixture(:store_sale)
    %{store_sale: store_sale}
  end
end
