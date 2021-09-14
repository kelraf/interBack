defmodule InterBack.StoreProducts do
  @moduledoc """
  The StoreProducts context.
  """

  import Ecto.Query, warn: false
  import Ecto.Changeset
  alias InterBack.{Repo, StoreProducts.StoreProduct, WarehouseProducts.WarehouseProduct}
  alias Ecto.Multi

  @doc """
  Returns the list of storeproducts.

  ## Examples

      iex> list_storeproducts()
      [%StoreProduct{}, ...]

  """
  def list_storeproducts do
    Repo.all(StoreProduct)
  end

  @doc """
  Gets a single store_product.

  Raises `Ecto.NoResultsError` if the Store product does not exist.

  ## Examples

      iex> get_store_product!(123)
      %StoreProduct{}

      iex> get_store_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_store_product!(id), do: Repo.get!(StoreProduct, id)

  @doc """
  Creates a store_product.

  ## Examples

      iex> create_store_product(%{field: value})
      {:ok, %StoreProduct{}}

      iex> create_store_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_store_product(attrs \\ %{}) do

    changeset_results = %StoreProduct{} |> StoreProduct.changeset(attrs) #|> IO.inspect #|> Repo.insert()

    if changeset_results.valid? do
      IO.inspect(changeset_results)
    else 
      IO.puts("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
    end

    # warehouse_product_changeset = 
    #   changeset_results
    #   |> get_field(:new_warehouseproduct_changeset)
    #   |> Map.get(:w_changeset)


    # multi_results = 
    #   Multi.new()
    #   |> Multi.insert(:store_product, changeset_results)
    #   |> Multi.update(:warehouse_product, warehouse_product_changeset)
    #   |> Repo.transaction()
    #   |> IO.inspect

      # case multi_results do
      #   {:ok, %{store_product: store_product, warehouse_product: _warehouse_product}} ->
      #     store_product
      #   {:error, failed_operation, failed_value, changes_so_far} -> 
          
      # end

  end

  @doc """
  Updates a store_product.

  ## Examples

      iex> update_store_product(store_product, %{field: new_value})
      {:ok, %StoreProduct{}}

      iex> update_store_product(store_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_store_product(%StoreProduct{} = store_product, attrs) do
    store_product
    |> StoreProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a store_product.

  ## Examples

      iex> delete_store_product(store_product)
      {:ok, %StoreProduct{}}

      iex> delete_store_product(store_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_store_product(%StoreProduct{} = store_product) do
    Repo.delete(store_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking store_product changes.

  ## Examples

      iex> change_store_product(store_product)
      %Ecto.Changeset{data: %StoreProduct{}}

  """
  def change_store_product(%StoreProduct{} = store_product, attrs \\ %{}) do
    StoreProduct.changeset(store_product, attrs)
  end
end
