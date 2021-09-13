defmodule InterBackWeb.WarehouseProductView do
  use InterBackWeb, :view
  alias InterBackWeb.WarehouseProductView

  def render("index.json", %{warehouseproducts: warehouseproducts}) do
    %{data: render_many(warehouseproducts, WarehouseProductView, "warehouse_product.json")}
  end

  def render("show.json", %{warehouse_product: warehouse_product}) do
    %{data: render_one(warehouse_product, WarehouseProductView, "warehouse_product.json")}
  end

  def render("warehouse_product.json", %{warehouse_product: warehouse_product}) do
    %{id: warehouse_product.id,
      product_name: warehouse_product.product_name,
      quantity: warehouse_product.quantity,
      category: warehouse_product.category}
  end
end
