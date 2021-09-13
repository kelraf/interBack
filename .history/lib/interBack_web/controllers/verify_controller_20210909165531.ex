defmodule InterBackWeb.VerifyController do
  use InterBackWeb, :controller

  alias InterBack.Verification
  alias InterBack.Verification.Verify

  action_fallback InterBackWeb.FallbackController

  def index(conn, _params) do
    verifies = Verification.list_verifies()
    render(conn, "index.json", verifies: verifies)
  end

  def create(conn, %{"verify" => verify_params}) do
    with {:ok, %Verify{} = verify} <- Verification.create_verify(verify_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.verify_path(conn, :show, verify))
      |> render("show.json", verify: verify)
    end
  end

  def show(conn, %{"id" => id}) do
    verify = Verification.get_verify!(id)
    render(conn, "show.json", verify: verify)
  end

  def update(conn, %{"id" => id, "verify" => verify_params}) do
    verify = Verification.get_verify!(id)

    with {:ok, %Verify{} = verify} <- Verification.update_verify(verify, verify_params) do
      render(conn, "show.json", verify: verify)
    end
  end

  def delete(conn, %{"id" => id}) do
    verify = Verification.get_verify!(id)

    with {:ok, %Verify{}} <- Verification.delete_verify(verify) do
      send_resp(conn, :no_content, "")
    end
  end
end
