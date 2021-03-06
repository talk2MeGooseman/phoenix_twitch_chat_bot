defmodule PhoenixStreamlabsClone.UserManager.User do
  @moduledoc """
  Our User ecto schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password,         :string
    field :username,         :string
    field :email,            :string
    field :uid,              :string
    field :description,      :string
    field :profile_image_url, :string
    field :provider,         :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :email, :uid, :description, :profile_image_url, :provider])
    |> validate_required([:username, :password, :email, :uid])
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
