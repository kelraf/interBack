defmodule InterBackWeb.WarehouseProductController do
  use InterBackWeb, :controller

  alias InterBack.WarehouseProducts
  alias InterBack.WarehouseProducts.WarehouseProduct

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    warehouseproducts = WarehouseProducts.list_warehouseproducts()
    render(conn, "index.json", warehouseproducts: warehouseproducts)
  end

  def create(conn, %{"warehouse_product" => warehouse_product_params}) do
    with {:ok, %WarehouseProduct{} = warehouse_product} <- WarehouseProducts.create_warehouse_product(warehouse_product_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.warehouse_product_path(conn, :show, warehouse_product))
      |> render("show.json", warehouse_product: warehouse_product)
    end
  end

  def show(conn, %{"id" => id}) do
    warehouse_product = WarehouseProducts.get_warehouse_product!(id)
    render(conn, "show.json", warehouse_product: warehouse_product)
  end

  def update(conn, %{"id" => id, "warehouse_product" => warehouse_product_params}) do
    warehouse_product = WarehouseProducts.get_warehouse_product!(id)

    with {:ok, %WarehouseProduct{} = warehouse_product} <- WarehouseProducts.update_warehouse_product(warehouse_product, warehouse_product_params) do
      render(conn, "show.json", warehouse_product: warehouse_product)
    end
  end

  def delete(conn, %{"id" => id}) do
    warehouse_product = WarehouseProducts.get_warehouse_product!(id)

    with {:ok, %WarehouseProduct{}} <- WarehouseProducts.delete_warehouse_product(warehouse_product) do
      send_resp(conn, :no_content, "")
    end
  end
end
