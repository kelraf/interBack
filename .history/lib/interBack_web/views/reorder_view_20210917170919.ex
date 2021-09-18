defmodule InterBackWeb.ReorderView do
  use InterBackWeb, :view
  alias InterBackWeb.ReorderView

  def render("index.json", %{reorders: reorders}) do
    %{data: render_many(reorders, ReorderView, "reorder.json")}
  end

  def render("show.json", %{reorder: reorder}) do
    %{data: render_one(reorder, ReorderView, "reorder.json")}
  end

  def render("reorder.json", %{reorder: reorder}) do
    %{
      id: reorder.id,
      store_id: reorder.store_id,
      warehouseproduct_id: reorder.warehouseproduct_id,
      storeproduct_id: reorder.storeproduct_id,
      processed: reorder.processed,
      quantity: reorder.quantity,
      store: render_one(reorder.store, __MODULE__, "store.json", as: :store),
      warehouseproduct: render_one(reorder.warehouseproduct, __MODULE__, "warehouse_product.json", as: :warehouse_product)
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

  def render("store.json", %{store: store}) do
    %{
      id: store.id,
      user_id: store.user_id,
      store_name: store.store_name
    }
  end

  def render("store_product.json", %{store_product: store_product}) do
    %{
      id: store_product.id,
      store_id: store_product.store_id,
      quantity: store_product.quantity,
      min_quantity: store_product.min_quantity,
      user_id: store_product.user_id
    }
  end

end
