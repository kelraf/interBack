defmodule InterBack.Reorders do
  @moduledoc """
  The Reorders context.
  """

  import Ecto.Query, warn: false
  alias InterBack.Repo

  alias InterBack.Reorders.Reorder

  @doc """
  Returns the list of reorders.

  ## Examples

      iex> list_reorders()
      [%Reorder{}, ...]

  """
  def list_reorders do
    Repo.all(Reorder)
  end

  @doc """
  Gets a single reorder.

  Raises `Ecto.NoResultsError` if the Reorder does not exist.

  ## Examples

      iex> get_reorder!(123)
      %Reorder{}

      iex> get_reorder!(456)
      ** (Ecto.NoResultsError)

  """
  def get_reorder!(id), do: Repo.get!(Reorder, id)

  @doc """
  Creates a reorder.

  ## Examples

      iex> create_reorder(%{field: value})
      {:ok, %Reorder{}}

      iex> create_reorder(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_reorder(attrs \\ %{}) do
    %Reorder{}
    |> Reorder.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a reorder.

  ## Examples

      iex> update_reorder(reorder, %{field: new_value})
      {:ok, %Reorder{}}

      iex> update_reorder(reorder, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_reorder(%Reorder{} = reorder, attrs, id, update) do
    reorder
    |> Reorder.changeset(attrs, id, update)
    |> Repo.update()
  end

  @doc """
  Deletes a reorder.

  ## Examples

      iex> delete_reorder(reorder)
      {:ok, %Reorder{}}

      iex> delete_reorder(reorder)
      {:error, %Ecto.Changeset{}}

  """
  def delete_reorder(%Reorder{} = reorder) do
    Repo.delete(reorder)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking reorder changes.

  ## Examples

      iex> change_reorder(reorder)
      %Ecto.Changeset{data: %Reorder{}}

  """
  def change_reorder(%Reorder{} = reorder, attrs \\ %{}) do
    Reorder.changeset(reorder, attrs)
  end
end
