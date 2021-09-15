defmodule InterBackWeb.ReorderController do
  use InterBackWeb, :controller

  alias InterBack.Reorders
  alias InterBack.Reorders.Reorder

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    reorders = Reorders.list_reorders()
    render(conn, "index.json", reorders: reorders)
  end

  def show(conn, %{"id" => id}) do
    reorder = Reorders.get_reorder!(id)
    render(conn, "show.json", reorder: reorder)
  end

  def update(conn, %{"id" => id, "reorder" => reorder_params}) do
    reorder = Reorders.get_reorder!(id)

    with {:ok, %Reorder{} = reorder} <- Reorders.update_reorder(reorder, reorder_params) do
      render(conn, "show.json", reorder: reorder)
    end
  end
  
end
