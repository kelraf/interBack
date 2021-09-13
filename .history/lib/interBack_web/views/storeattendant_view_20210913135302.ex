defmodule InterBackWeb.StoreattendantView do
  use InterBackWeb, :view
  alias InterBackWeb.StoreattendantView
  alias InterBackWeb.UserView

  def render("index.json", %{storeattendants: storeattendants}) do
    %{data: render_many(storeattendants, StoreattendantView, "storeattendant.json")}
  end

  def render("show.json", %{storeattendant: storeattendant}) do
    %{data: render_one(storeattendant, StoreattendantView, "storeattendant.json")}
  end

  def render("storeattendant.json", %{storeattendant: storeattendant}) do
    %{
      id: storeattendant.id,
      user_id: storeattendant.user_id,
      store_id: storeattendant.store_id,
      user: render_one(storeattendant.user, UserView, "user.json", as: :storeattendant)
    }
  end
end
