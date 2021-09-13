defmodule InterBack.Verification do
  @moduledoc """
  The Verification context.
  """

  import Ecto.Query, warn: false
  alias InterBack.Repo

  alias InterBack.Verification.Verify

  @doc """
  Returns the list of verifies.

  ## Examples

      iex> list_verifies()
      [%Verify{}, ...]

  """
  def list_verifies do
    Repo.all(Verify)
  end

  @doc """
  Gets a single verify.

  Raises `Ecto.NoResultsError` if the Verify does not exist.

  ## Examples

      iex> get_verify!(123)
      %Verify{}

      iex> get_verify!(456)
      ** (Ecto.NoResultsError)

  """
  def get_verify!(id), do: Repo.get!(Verify, id)

  @doc """
  Creates a verify.

  ## Examples

      iex> create_verify(%{field: value})
      {:ok, %Verify{}}

      iex> create_verify(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_verify(attrs \\ %{}) do
    %Verify{}
    |> Verify.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a verify.

  ## Examples

      iex> update_verify(verify, %{field: new_value})
      {:ok, %Verify{}}

      iex> update_verify(verify, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_verify(%Verify{} = verify, attrs) do
    verify
    |> Verify.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a verify.

  ## Examples

      iex> delete_verify(verify)
      {:ok, %Verify{}}

      iex> delete_verify(verify)
      {:error, %Ecto.Changeset{}}

  """
  def delete_verify(%Verify{} = verify) do
    Repo.delete(verify)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking verify changes.

  ## Examples

      iex> change_verify(verify)
      %Ecto.Changeset{data: %Verify{}}

  """
  def change_verify(%Verify{} = verify, attrs \\ %{}) do
    Verify.changeset(verify, attrs)
  end
end
