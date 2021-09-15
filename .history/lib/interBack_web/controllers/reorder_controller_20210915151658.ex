defmodule InterBackWeb.ReorderController do
  use InterBackWeb, :controller

  alias InterBack.Reorders
  alias InterBack.Reorders.Reorder

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    reorders = Reorders.list_reorders()
    render(conn, "index.json", reorders: reorders)
  end

  def create(conn, %{"reorder" => reorder_params}) do
    with {:ok, %Reorder{} = reorder} <- Reorders.create_reorder(reorder_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.reorder_path(conn, :show, reorder))
      |> render("show.json", reorder: reorder)
    end
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

  # def delete(conn, %{"id" => id}) do
  #   reorder = Reorders.get_reorder!(id)

  #   with {:ok, %Reorder{}} <- Reorders.delete_reorder(reorder) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
