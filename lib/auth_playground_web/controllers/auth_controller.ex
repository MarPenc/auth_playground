defmodule AuthPlaygroundWeb.AuthController do
  use AuthPlaygroundWeb, :controller

  alias AuthPlayground.Auth
  alias AuthPlayground.Auth.AuthUser

  def new(conn, _params) do
    changeset = Auth.change_auth_user(%AuthUser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"auth_user" => auth_user_params}) do
    case Auth.create_auth_user(auth_user_params) do
      {:ok, auth_user} ->
        conn
        |> put_session(:current_user_id, auth_user.id)
        |> put_flash(:info, "User signed up.")
        |> redirect(to: page_path(conn, :index))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

end
