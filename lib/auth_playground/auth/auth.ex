defmodule AuthPlayground.Auth do
  @moduledoc """
  The Auth context.
  """

  import Ecto.Query, warn: false
  alias AuthPlayground.Repo

  alias AuthPlayground.Auth.AuthUser

  @doc """
  Returns the list of auth_users.

  ## Examples

      iex> list_auth_users()
      [%AuthUser{}, ...]

  """
  def list_auth_users do
    Repo.all(AuthUser)
  end

  @doc """
  Gets a single auth_user.

  Raises `Ecto.NoResultsError` if the Auth user does not exist.

  ## Examples

      iex> get_auth_user!(123)
      %AuthUser{}

      iex> get_auth_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_auth_user!(id), do: Repo.get!(AuthUser, id)

  @doc """
  Creates a auth_user.

  ## Examples

      iex> create_auth_user(%{field: value})
      {:ok, %AuthUser{}}

      iex> create_auth_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_auth_user(attrs \\ %{}) do
    %AuthUser{}
    |> AuthUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a auth_user.

  ## Examples

      iex> update_auth_user(auth_user, %{field: new_value})
      {:ok, %AuthUser{}}

      iex> update_auth_user(auth_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_auth_user(%AuthUser{} = auth_user, attrs) do
    auth_user
    |> AuthUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a AuthUser.

  ## Examples

      iex> delete_auth_user(auth_user)
      {:ok, %AuthUser{}}

      iex> delete_auth_user(auth_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_auth_user(%AuthUser{} = auth_user) do
    Repo.delete(auth_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking auth_user changes.

  ## Examples

      iex> change_auth_user(auth_user)
      %Ecto.Changeset{source: %AuthUser{}}

  """
  def change_auth_user(%AuthUser{} = auth_user) do
    AuthUser.changeset(auth_user, %{})
  end

  def get_by_email(email) when is_nil(email), do: nil
  def get_by_email(email), do: Repo.get_by(AuthUser, email: email)

end
