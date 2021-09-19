defmodule InterBackWeb.StoreSaleView do
  use InterBackWeb, :view
  alias InterBackWeb.StoreSaleView

  def render("index.json", %{storesales: storesales}) do
    %{data: render_many(storesales, StoreSaleView, "store_sale.json")}
  end

  def render("show.json", %{store_sale: store_sale}) do
    %{data: render_one(store_sale, StoreSaleView, "store_sale.json")}
  end

  def render("store_sale.json", %{store_sale: store_sale}) do
    %{
      id: store_sale.id,
      storeproduct_id: store_sale.storeproduct_id,
      quantity: store_sale.quantity,
      warehouseproduct_id: store_sale.warehouseproduct_id,
      store_id: store_sale.store_id,
      user_id: store_sale.user_id
    }
  end

  def render("warehouse_product.json", %{warehouse_product: warehouse_product}) do
    %{
      id: warehouse_product.id,
      product_name: warehouse_product.product_name,
      quantity: warehouse_product.quantity,
      category: warehouse_product.category,
      user: render_one(warehouse_product.user, UserView, "user.json", as: :user),
      reorders: render_many(warehouse_product.reorders, __MODULE__, "reorder.json", as: :reorder)
    }
  end
  
end
