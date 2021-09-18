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
      quantity: reorder.quantity
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

end
