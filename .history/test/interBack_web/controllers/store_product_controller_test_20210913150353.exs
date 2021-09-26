defmodule InterBackWeb.StoreProductControllerTest do
  use InterBackWeb.ConnCase

  alias InterBack.StoreProducts
  alias InterBack.StoreProducts.StoreProduct

  @create_attrs %{
    min_quantity: 42,
    quantity: 42,
    store_id: 42,
    user_id: 42
  }
  @update_attrs %{
    min_quantity: 43,
    quantity: 43,
    store_id: 43,
    user_id: 43
  }
  @invalid_attrs %{min_quantity: nil, quantity: nil, store_id: nil, user_id: nil}

  def fixture(:store_product) do
    {:ok, store_product} = StoreProducts.create_store_product(@create_attrs)
    store_product
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all storeproducts", %{conn: conn} do
      conn = get(conn, Routes.store_product_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create store_product" do
    test "renders store_product when data is valid", %{conn: conn} do
      conn = post(conn, Routes.store_product_path(conn, :create), store_product: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.store_product_path(conn, :show, id))

      assert %{
               "id" => id,
               "min_quantity" => 42,
               "quantity" => 42,
               "store_id" => 42,
               "user_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.store_product_path(conn, :create), store_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update store_product" do
    setup [:create_store_product]

    test "renders store_product when data is valid", %{conn: conn, store_product: %StoreProduct{id: id} = store_product} do
      conn = put(conn, Routes.store_product_path(conn, :update, store_product), store_product: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.store_product_path(conn, :show, id))

      assert %{
               "id" => id,
               "min_quantity" => 43,
               "quantity" => 43,
               "store_id" => 43,
               "user_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, store_product: store_product} do
      conn = put(conn, Routes.store_product_path(conn, :update, store_product), store_product: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete store_product" do
    setup [:create_store_product]

    test "deletes chosen store_product", %{conn: conn, store_product: store_product} do
      conn = delete(conn, Routes.store_product_path(conn, :delete, store_product))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.store_product_path(conn, :show, store_product))
      end
    end
  end

  defp create_store_product(_) do
    store_product = fixture(:store_product)
    %{store_product: store_product}
  end
end
