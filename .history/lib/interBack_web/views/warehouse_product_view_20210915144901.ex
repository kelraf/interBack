defmodule InterBackWeb.WarehouseProductView do
  use InterBackWeb, :view
  alias InterBackWeb.{WarehouseProductView, UserView, ReorderView}

  def render("index.json", %{warehouseproducts: warehouseproducts}) do
    %{data: render_many(warehouseproducts, WarehouseProductView, "warehouse_product.json")}
  end

  def render("show.json", %{warehouse_product: warehouse_product}) do
    %{data: render_one(warehouse_product, WarehouseProductView, "warehouse_product.json")}
  end

  def render("warehouse_product.json", %{warehouse_product: warehouse_product}) do
    %{
      id: warehouse_product.id,
      product_name: warehouse_product.product_name,
      quantity: warehouse_product.quantity,
      category: warehouse_product.category,
      user: render_one(warehouse_product.user, UserView, "user.json", as: :user),
      reorders: render_many(warehouse_product.reorders, ReorderView, "reorder.json", as: :reorder)
    }
  end
end
