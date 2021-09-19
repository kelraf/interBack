defmodule InterBackWeb.StoreSaleController do
  use InterBackWeb, :controller

  alias InterBack.{StoreSales, StoreSales.StoreSale, Repo}

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    storesales = StoreSales.list_storesales()
    render(conn, "index.json", storesales: storesales)
  end

  def create(conn, %{"store_sale" => store_sale_params}) do
    with {:ok, %StoreSale{} = store_sale} <- StoreSales.create_store_sale(store_sale_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.store_sale_path(conn, :show, store_sale))
      |> render("show.json", store_sale: store_sale)
    end
  end

  def show(conn, %{"id" => id}) do
    store_sale = StoreSales.get_store_sale!(id)
    render(conn, "show.json", store_sale: store_sale)
  end

  def update(conn, %{"id" => id, "store_sale" => store_sale_params}) do
    store_sale = StoreSales.get_store_sale!(id)

    with {:ok, %StoreSale{} = store_sale} <- StoreSales.update_store_sale(store_sale, store_sale_params) do
      render(conn, "show.json", store_sale: store_sale)
    end
  end

  def delete(conn, %{"id" => id}) do
    store_sale = StoreSales.get_store_sale!(id)

    with {:ok, %StoreSale{}} <- StoreSales.delete_store_sale(store_sale) do
      send_resp(conn, :no_content, "")
    end
  end

  defp preloader(data) do
    data |> Repo.preload(:warehouseproduct)
  end
end
