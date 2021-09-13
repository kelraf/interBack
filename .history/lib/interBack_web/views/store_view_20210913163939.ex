defmodule InterBackWeb.StoreView do
  use InterBackWeb, :view
  alias InterBackWeb.{StoreView, StoreattendantView}

  def render("index.json", %{stores: stores}) do
    %{data: render_many(stores, StoreView, "store.json")}
  end

  def render("show.json", %{store: store}) do
    %{data: render_one(store, StoreView, "store.json")}
  end

  def render("store.json", %{store: store}) do
    %{
      id: store.id,
      user_id: store.user_id,
      store_name: store.store_name,
      storeattendant: render_one(store.storeattendant, StoreattendantView, "storeattendant.json", as: :storeattendant),
      store_products: render_many(store.storeproducts, __MODULE__, "storeproduct.json", as: :store_products)
    }
  end

  def render("store_product.json", %{store_product: store_product}) do
    %{
      id: store_product.id,
      quantity: store_product.quantity,
      min_quantity: store_product.min_quantity,
      user_id: store_product.user_id
    }
  end

end
