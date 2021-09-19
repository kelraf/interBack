defmodule InterBackWeb.StoreController do
  use InterBackWeb, :controller

  alias InterBack.Stores
  alias InterBack.{Stores.Store, Repo}

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    stores = Stores.list_stores()
    IO.inspect(stores |> Repo.preload([:storeproducts, :storeattendant]))
    render(conn, "index.json", stores: stores |> preloader())
  end

  def create(conn, %{"store" => store_params}) do
    with {:ok, %Store{} = store} <- Stores.create_store(store_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.store_path(conn, :show, store))
      |> render("show.json", store: store |> preloader())
    end
  end

  def show(conn, %{"id" => id}) do
    store = Stores.get_store!(id)
    render(conn, "show.json", store: store |> preloader())
  end

  def update(conn, %{"id" => id, "store" => store_params}) do
    store = Stores.get_store!(id)

    with {:ok, %Store{} = store} <- Stores.update_store(store, store_params) do
      render(conn, "show.json", store: store |> preloader())
    end
  end

  def delete(conn, %{"id" => id}) do
    store = Stores.get_store!(id)

    with {:ok, %Store{}} <- Stores.delete_store(store) do
      send_resp(conn, :no_content, "")
    end
  end

  defp preloader(data) do
    data |> Repo.preload([
      storeattendant: [:user, :store],
      storeproducts: []
    ])
  end
end
