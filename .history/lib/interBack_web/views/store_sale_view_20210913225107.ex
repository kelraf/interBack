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
end
