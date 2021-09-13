defmodule InterBackWeb.UserController do
  use InterBackWeb, :controller

  alias InterBack.Accounts
  alias InterBack.Accounts.User
  alias InterBack.Auth

  action_fallback InterBackWeb.FallbackController

  def login(conn, %{"user" => user}) do

    case Auth.login user do
      {:ok, user, token} -> json(conn, %{user: user |> IO.inspect(label: "Before Struct to Map") |> Map.from_struct |> Map.drop([:__meta__, :inserted_at, :password, :updated_at]) |> IO.inspect(label: "After Struct to Map Convertion"), token: token})
      {:error, msg} -> json(conn, %{message: msg})
      _ -> json(conn, %{message: "Oops!!! Unknown Error"})
    end
    
  end

  def index(conn, _params) do
    user = Accounts.list_user()
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
