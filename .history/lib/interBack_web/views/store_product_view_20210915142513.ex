defmodule InterBackWeb.StoreProductView do
  use InterBackWeb, :view
  alias InterBackWeb.{StoreProductView, UserView, ReorderView}

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
      store: render_one(store_product.store, __MODULE__, "store.json", as: :store),
      user: render_one(store_product.user, UserView, "user.json", as: :user),
      warehouse_product: render_one(store_product.warehouseproduct, __MODULE__, "warehouse_product.json", as: :warehouse_product)
    }
  end

  def render("store.json", %{store: store}) do
    %{
      id: store.id,
      user_id: store.user_id,
      store_name: store.store_name,
    }
  end

  def render("warehouse_product.json", %{warehouse_product: warehouse_product}) do
    %{
      id: warehouse_product.id,
      product_name: warehouse_product.product_name,
      quantity: warehouse_product.quantity,
      category: warehouse_product.category,
    }
  end

end
