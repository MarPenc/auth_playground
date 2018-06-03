defmodule AuthPlayground.Auth.AuthUser do
  use Ecto.Schema
  import Ecto.Changeset

  schema "auth_users" do
    field :email, :string

    # Note to self: would be easier if that key were eiher password_hash or
    # encrypted_password due to the expected keyword handling in Bcrypt
    # https://hexdocs.pm/comeonin/Comeonin.Bcrypt.html#check_pass/3
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(auth_user, attrs) do
    auth_user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_length(:password, min: 8)
    |> update_change(:password, &Comeonin.Bcrypt.hashpwsalt/1)
  end


end
