defmodule AuthPlayground.AuthTest do
  use AuthPlayground.DataCase

  alias AuthPlayground.Auth

  describe "auth_users" do
    alias AuthPlayground.Auth.AuthUser

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def auth_user_fixture(attrs \\ %{}) do
      {:ok, auth_user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_auth_user()

      auth_user
    end

    test "list_auth_users/0 returns all auth_users" do
      auth_user = auth_user_fixture()
      assert Auth.list_auth_users() == [auth_user]
    end

    test "get_auth_user!/1 returns the auth_user with given id" do
      auth_user = auth_user_fixture()
      assert Auth.get_auth_user!(auth_user.id) == auth_user
    end

    test "create_auth_user/1 with valid data creates a auth_user" do
      assert {:ok, %AuthUser{} = auth_user} = Auth.create_auth_user(@valid_attrs)
      assert auth_user.email == "some email"
      assert auth_user.password_hash == "some password_hash"
    end

    test "create_auth_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_auth_user(@invalid_attrs)
    end

    test "update_auth_user/2 with valid data updates the auth_user" do
      auth_user = auth_user_fixture()
      assert {:ok, auth_user} = Auth.update_auth_user(auth_user, @update_attrs)
      assert %AuthUser{} = auth_user
      assert auth_user.email == "some updated email"
      assert auth_user.password_hash == "some updated password_hash"
    end

    test "update_auth_user/2 with invalid data returns error changeset" do
      auth_user = auth_user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_auth_user(auth_user, @invalid_attrs)
      assert auth_user == Auth.get_auth_user!(auth_user.id)
    end

    test "delete_auth_user/1 deletes the auth_user" do
      auth_user = auth_user_fixture()
      assert {:ok, %AuthUser{}} = Auth.delete_auth_user(auth_user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_auth_user!(auth_user.id) end
    end

    test "change_auth_user/1 returns a auth_user changeset" do
      auth_user = auth_user_fixture()
      assert %Ecto.Changeset{} = Auth.change_auth_user(auth_user)
    end
  end
end
