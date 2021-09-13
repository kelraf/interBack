defmodule InterBack.WarehouseProducts do
  @moduledoc """
  The WarehouseProducts context.
  """

  import Ecto.Query, warn: false
  alias InterBack.Repo

  alias InterBack.WarehouseProducts.WarehouseProduct

  @doc """
  Returns the list of warehouseproducts.

  ## Examples

      iex> list_warehouseproducts()
      [%WarehouseProduct{}, ...]

  """
  def list_warehouseproducts do
    Repo.all(WarehouseProduct)
  end

  @doc """
  Gets a single warehouse_product.

  Raises `Ecto.NoResultsError` if the Warehouse product does not exist.

  ## Examples

      iex> get_warehouse_product!(123)
      %WarehouseProduct{}

      iex> get_warehouse_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_warehouse_product!(id), do: Repo.get!(WarehouseProduct, id)

  @doc """
  Creates a warehouse_product.

  ## Examples

      iex> create_warehouse_product(%{field: value})
      {:ok, %WarehouseProduct{}}

      iex> create_warehouse_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_warehouse_product(attrs \\ %{}) do
    %WarehouseProduct{}
    |> WarehouseProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a warehouse_product.

  ## Examples

      iex> update_warehouse_product(warehouse_product, %{field: new_value})
      {:ok, %WarehouseProduct{}}

      iex> update_warehouse_product(warehouse_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_warehouse_product(%WarehouseProduct{} = warehouse_product, attrs) do
    warehouse_product
    |> WarehouseProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a warehouse_product.

  ## Examples

      iex> delete_warehouse_product(warehouse_product)
      {:ok, %WarehouseProduct{}}

      iex> delete_warehouse_product(warehouse_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_warehouse_product(%WarehouseProduct{} = warehouse_product) do
    Repo.delete(warehouse_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking warehouse_product changes.

  ## Examples

      iex> change_warehouse_product(warehouse_product)
      %Ecto.Changeset{data: %WarehouseProduct{}}

  """
  def change_warehouse_product(%WarehouseProduct{} = warehouse_product, attrs \\ %{}) do
    WarehouseProduct.changeset(warehouse_product, attrs)
  end
end
