defmodule AuthPlaygroundWeb.AuthUserControllerTest do
  use AuthPlaygroundWeb.ConnCase

  alias AuthPlayground.Auth

  @create_attrs %{email: "some email", password_hash: "some password_hash"}
  @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
  @invalid_attrs %{email: nil, password_hash: nil}

  def fixture(:auth_user) do
    {:ok, auth_user} = Auth.create_auth_user(@create_attrs)
    auth_user
  end

  describe "index" do
    test "lists all auth_users", %{conn: conn} do
      conn = get conn, auth_user_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Auth users"
    end
  end

  describe "new auth_user" do
    test "renders form", %{conn: conn} do
      conn = get conn, auth_user_path(conn, :new)
      assert html_response(conn, 200) =~ "New Auth user"
    end
  end

  describe "create auth_user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, auth_user_path(conn, :create), auth_user: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == auth_user_path(conn, :show, id)

      conn = get conn, auth_user_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Auth user"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, auth_user_path(conn, :create), auth_user: @invalid_attrs
      assert html_response(conn, 200) =~ "New Auth user"
    end
  end

  describe "edit auth_user" do
    setup [:create_auth_user]

    test "renders form for editing chosen auth_user", %{conn: conn, auth_user: auth_user} do
      conn = get conn, auth_user_path(conn, :edit, auth_user)
      assert html_response(conn, 200) =~ "Edit Auth user"
    end
  end

  describe "update auth_user" do
    setup [:create_auth_user]

    test "redirects when data is valid", %{conn: conn, auth_user: auth_user} do
      conn = put conn, auth_user_path(conn, :update, auth_user), auth_user: @update_attrs
      assert redirected_to(conn) == auth_user_path(conn, :show, auth_user)

      conn = get conn, auth_user_path(conn, :show, auth_user)
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, auth_user: auth_user} do
      conn = put conn, auth_user_path(conn, :update, auth_user), auth_user: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Auth user"
    end
  end

  describe "delete auth_user" do
    setup [:create_auth_user]

    test "deletes chosen auth_user", %{conn: conn, auth_user: auth_user} do
      conn = delete conn, auth_user_path(conn, :delete, auth_user)
      assert redirected_to(conn) == auth_user_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, auth_user_path(conn, :show, auth_user)
      end
    end
  end

  defp create_auth_user(_) do
    auth_user = fixture(:auth_user)
    {:ok, auth_user: auth_user}
  end
end
