defmodule Ecto.SoftDelete.Migration do
  @moduledoc """
  Contains functions to add soft delete columns to a table during migrations
  """

  use Ecto.Migration

  @doc """
  Adds soft_deleted_at column to a table. This column is used to track if an item is deleted or not and when
  Adds an index 

      defmodule MyApp.Repo.Migrations.CreateUser do
        use Ecto.Migration
        import Ecto.SoftDelete.Migration

        def change do
          create table(:users) do
            add :email, :string
            add :password, :string
            timestamps()
            soft_delete_columns(:users)
          end
        end
      end

  """
  def soft_delete_columns() do
    add(:soft_deleted_at, :utc_datetime_usec, [])
  end
end
