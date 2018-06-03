defmodule AuthPlaygroundWeb.Helpers.Auth do

  def signed_in?(conn) do
    if user_id = Plug.Conn.get_session(conn, :current_user_id) do
      !!AuthPlayground.Auth.get_auth_user!(user_id)
    end
  end
end
