defmodule InterBackWeb.StoreProductView do
  use InterBackWeb, :view
  alias InterBackWeb.{StoreProductView, WarehouseProductView, UserView}

  def render("index.json", %{storeproducts: storeproducts}) do
    %{data: render_many(storeproducts, StoreProductView, "store_product.json")}
  end

  def render("show.json", %{store_product: store_product}) do
    %{data: render_one(store_product, StoreProductView, "store_product.json")}
  end

  def render("store_product.json", %{store_product: store_product}) do
    %{
      id: store_product.id,
      store_id: store_product.store_id,
      quantity: store_product.quantity,
      min_quantity: store_product.min_quantity,
      user_id: store_product.user_id,
      store: render_one(store_product.store, __MODULE__, "store.json", as: :store)
    }
  end

  def render("store.json", %{store: store}) do
    %{
      id: store.id,
      user_id: store.user_id,
      store_name: store.store_name,
    }
  end

end
