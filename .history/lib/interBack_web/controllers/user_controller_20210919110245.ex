defmodule InterBackWeb.UserController do
  use InterBackWeb, :controller

  alias InterBack.{Accounts, Accounts.User, Auth, Verification, Repo}
  
  action_fallback InterBackWeb.FallbackController

  # Auth Section
  def login(conn, %{"user" => user}) do

    case Auth.login user do
      {:ok, user, token} -> json(conn, %{success: true, store_id: user |> Repo.preload(:storeattendant) |> Map.from_struct |> Map.drop(:__meta__), user: user |> Map.from_struct |> Map.drop([:__meta__, :inserted_at, :password, :updated_at, :storeattendant]), token: token, message: "Login Successful."})
      {:error, msg} -> json(conn, %{success: false, message: msg})
      _ -> json(conn, %{success: false, message: "Oops!!! Unknown Error"})
    end
    
  end

  # def resendCode(conn, %{"user" => user}) do
    
  # end

  def codeHandler(%{id: id} = _user) do

    code_info = 
    %{}
    |> Map.put(:code, Enum.random(1_000..9_999))
    |> Map.put(:user_id, id)
    
  end

  # End of auth section

  def index(conn, _params) do
    user = Accounts.list_user()
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"user" => user_params}) do
    IO.inspect user_params
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
