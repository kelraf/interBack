defmodule InterBackWeb.StoreProductController do
  use InterBackWeb, :controller

  alias InterBack.{StoreProducts.StoreProduct, Repo, StoreProducts}

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    storeproducts = StoreProducts.list_storeproducts()
    render(conn, "index.json", storeproducts: storeproducts |> preloader())
  end

  def create(conn, %{"store_product" => store_product_params}) do
    with {:ok, %StoreProduct{} = store_product} <- StoreProducts.create_store_product(store_product_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.store_product_path(conn, :show, store_product))
      |> render("show.json", store_product: store_product |> preloader())
    end
  end

  def show(conn, %{"id" => id}) do
    store_product = StoreProducts.get_store_product!(id)
    render(conn, "show.json", store_product: store_product |> preloader())
  end

  def update(conn, %{"id" => id, "store_product" => store_product_params}) do
    store_product = StoreProducts.get_store_product!(id)

    with {:ok, %StoreProduct{} = store_product} <- StoreProducts.update_store_product(store_product, store_product_params) do
      render(conn, "show.json", store_product: store_product |> preloader())
    end
  end

  def delete(conn, %{"id" => id}) do
    store_product = StoreProducts.get_store_product!(id)

    with {:ok, %StoreProduct{}} <- StoreProducts.delete_store_product(store_product) do
      send_resp(conn, :no_content, "")
    end
  end

  defp preloader(data) do
    data |> Repo.preload([:user, :warehouseproduct, :store])
  end
end
