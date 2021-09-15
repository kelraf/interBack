defmodule InterBack.StoreSales do
  @moduledoc """
  The StoreSales context.
  """

  import Ecto.Query, warn: false
  alias InterBack.{Repo, StoreSales.StoreSale}
  import Ecto.Changeset
  alias Ecto.Multi
  @doc """
  Returns the list of storesales.

  ## Examples

      iex> list_storesales()
      [%StoreSale{}, ...]

  """
  def list_storesales do
    Repo.all(StoreSale)
  end

  @doc """
  Gets a single store_sale.

  Raises `Ecto.NoResultsError` if the Store sale does not exist.

  ## Examples

      iex> get_store_sale!(123)
      %StoreSale{}

      iex> get_store_sale!(456)
      ** (Ecto.NoResultsError)

  """
  def get_store_sale!(id), do: Repo.get!(StoreSale, id)

  @doc """
  Creates a store_sale.

  ## Examples

      iex> create_store_sale(%{field: value})
      {:ok, %StoreSale{}}

      iex> create_store_sale(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_store_sale(attrs \\ %{}) do

    changeset_results = %StoreSale{} |> StoreSale.changeset(attrs) #|> Repo.insert()

    if changeset_results.valid? do
      
      store_product_changeset = 
        changeset_results
        |> get_field(:store_product_changeset)
        |> Map.get(:s_changeset)

        reorder_changeset = 
          changeset_results
          |> get_field(:store_product_changeset)
          |> Map.get(:r_changeset) |> IO.inspect(label: "XXXXXXXXXXXXXXXXXXXX ppppp")

      multi_results = 
        Multi.new()
        |> Multi.insert(:store_sale, changeset_results)
        |> Multi.update(:store_product, store_product_changeset)
        |> Repo.transaction()

      case multi_results do
        {:ok, %{store_sale: store_sale, store_product: _store_product}} ->
          {:ok, store_sale}
        {:error, _failed_operation, _failed_value, _changes_so_far} -> 
          {
            :error,
              action: :insert,
              changes: %{},
              errors: [
                transation: {"Failed"}              
              ],
              valid?: false
          }
      end

    else 
      {:error, changeset_results}
    end

  end

  @doc """
  Updates a store_sale.

  ## Examples

      iex> update_store_sale(store_sale, %{field: new_value})
      {:ok, %StoreSale{}}

      iex> update_store_sale(store_sale, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_store_sale(%StoreSale{} = store_sale, attrs) do
    store_sale
    |> StoreSale.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a store_sale.

  ## Examples

      iex> delete_store_sale(store_sale)
      {:ok, %StoreSale{}}

      iex> delete_store_sale(store_sale)
      {:error, %Ecto.Changeset{}}

  """
  def delete_store_sale(%StoreSale{} = store_sale) do
    Repo.delete(store_sale)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking store_sale changes.

  ## Examples

      iex> change_store_sale(store_sale)
      %Ecto.Changeset{data: %StoreSale{}}

  """
  def change_store_sale(%StoreSale{} = store_sale, attrs \\ %{}) do
    StoreSale.changeset(store_sale, attrs)
  end
end
