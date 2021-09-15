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
    %{id: reorder.id,
      store_id: reorder.store_id,
      warehouseproduct_id: reorder.warehouseproduct_id,
      storeproduct_id: reorder.storeproduct_id,
      processed: reorder.processed,
      quantity: reorder.quantity}
  end
end
