defmodule InterBackWeb.StoreView do
  use InterBackWeb, :view
  alias InterBackWeb.StoreView

  def render("index.json", %{stores: stores}) do
    %{data: render_many(stores, StoreView, "store.json")}
  end

  def render("show.json", %{store: store}) do
    %{data: render_one(store, StoreView, "store.json")}
  end

  def render("store.json", %{store: store}) do
    %{id: store.id,
      user_id: store.user_id,
      store_name: store.store_name}
  end
end
