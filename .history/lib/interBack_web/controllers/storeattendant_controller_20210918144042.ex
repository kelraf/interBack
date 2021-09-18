defmodule InterBackWeb.StoreattendantController do
  use InterBackWeb, :controller

  alias InterBack.{Storeattendats, Repo}
  alias InterBack.Storeattendats.Storeattendant

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    storeattendants = Storeattendats.list_storeattendants()
    render(conn, "index.json", storeattendants: storeattendants |> preloader())
  end

  def create(conn, %{"storeattendant" => storeattendant_params}) do
    with {:ok, %Storeattendant{} = storeattendant} <- Storeattendats.create_storeattendant(storeattendant_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.storeattendant_path(conn, :show, storeattendant))
      |> render("show.json", storeattendant: storeattendant |> preloader())
    end
  end

  def show(conn, %{"id" => id}) do
    storeattendant = Storeattendats.get_storeattendant!(id)
    render(conn, "show.json", storeattendant: storeattendant |> preloader())
  end

  def update(conn, %{"id" => id, "storeattendant" => storeattendant_params}) do
    storeattendant = Storeattendats.get_storeattendant!(id)

    with {:ok, %Storeattendant{} = storeattendant} <- Storeattendats.update_storeattendant(storeattendant, storeattendant_params) do
      render(conn, "show.json", storeattendant: storeattendant |> preloader())
    end
  end

  def delete(conn, %{"id" => id}) do
    storeattendant = Storeattendats.get_storeattendant!(id)

    with {:ok, %Storeattendant{}} <- Storeattendats.delete_storeattendant(storeattendant) do
      send_resp(conn, :no_content, "")
    end
  end

  defp preloader(data) do
    data |> Repo.preload([:user, :store])
  end
end
