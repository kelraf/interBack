defmodule InterBack.Storeattendats do
  @moduledoc """
  The Storeattendats context.
  """

  import Ecto.Query, warn: false
  alias InterBack.Repo

  alias InterBack.Storeattendats.Storeattendant

  @doc """
  Returns the list of storeattendants.

  ## Examples

      iex> list_storeattendants()
      [%Storeattendant{}, ...]

  """
  def list_storeattendants do
    Repo.all(Storeattendant)
  end

  @doc """
  Gets a single storeattendant.

  Raises `Ecto.NoResultsError` if the Storeattendant does not exist.

  ## Examples

      iex> get_storeattendant!(123)
      %Storeattendant{}

      iex> get_storeattendant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_storeattendant!(id), do: Repo.get!(Storeattendant, id)

  @doc """
  Creates a storeattendant.

  ## Examples

      iex> create_storeattendant(%{field: value})
      {:ok, %Storeattendant{}}

      iex> create_storeattendant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_storeattendant(attrs \\ %{}) do
    %Storeattendant{}
    |> Storeattendant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a storeattendant.

  ## Examples

      iex> update_storeattendant(storeattendant, %{field: new_value})
      {:ok, %Storeattendant{}}

      iex> update_storeattendant(storeattendant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_storeattendant(%Storeattendant{} = storeattendant, attrs) do
    storeattendant
    |> Storeattendant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a storeattendant.

  ## Examples

      iex> delete_storeattendant(storeattendant)
      {:ok, %Storeattendant{}}

      iex> delete_storeattendant(storeattendant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_storeattendant(%Storeattendant{} = storeattendant) do
    Repo.delete(storeattendant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking storeattendant changes.

  ## Examples

      iex> change_storeattendant(storeattendant)
      %Ecto.Changeset{data: %Storeattendant{}}

  """
  def change_storeattendant(%Storeattendant{} = storeattendant, attrs \\ %{}) do
    Storeattendant.changeset(storeattendant, attrs)
  end
end
