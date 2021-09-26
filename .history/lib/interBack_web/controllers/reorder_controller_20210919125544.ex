defmodule InterBackWeb.ReorderController do
  use InterBackWeb, :controller

  alias InterBack.{Reorders, Reorders.Reorder, Repo}

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    reorders = Reorders.list_reorders()
    render(conn, "index.json", reorders: reorders |> preloader)
  end

  def show(conn, %{"id" => id}) do
    reorder = Reorders.get_reorder!(id)
    render(conn, "show.json", reorder: reorder |> preloader)
  end

  def get_by_store_id(conn, %{"id" => id}) do

    reorders = Repo.all(from sp in Reorder, where: sp.store_id == ^id, select: sp)

    render(conn, "index.json", storeproducts: reorders |> preloader())

  end

  def update(conn, %{"id" => id, "reorder" => reorder_params}) do
    reorder = Reorders.get_reorder!(id)

    with {:ok, %Reorder{} = reorder} <- Reorders.update_reorder(reorder, reorder_params) do
      render(conn, "show.json", reorder: reorder |> preloader)
    end
  end

  defp preloader(data) do
    data |> Repo.preload([
      :warehouseproduct,
      :store,
      :storeproduct
    ])
  end
  
end
