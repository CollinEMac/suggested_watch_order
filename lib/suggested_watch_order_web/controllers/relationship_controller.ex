defmodule SuggestedWatchOrderWeb.RelationshipController do
  use SuggestedWatchOrderWeb, :controller

  alias SuggestedWatchOrder.Media
  alias SuggestedWatchOrder.Media.Relationship

  def index(conn, _params) do
    relationships = Media.list_relationships()
    render(conn, "index.html", relationships: relationships)
  end

  def new(conn, _params) do
    changeset = Media.change_relationship(%Relationship{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"relationship" => relationship_params}) do
    case Media.create_relationship(relationship_params) do
      {:ok, relationship} ->
        conn
        |> put_flash(:info, "Relationship created successfully.")
        |> redirect(to: Routes.relationship_path(conn, :show, relationship))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    relationship = Media.get_relationship!(id)
    render(conn, "show.html", relationship: relationship)
  end

  def edit(conn, %{"id" => id}) do
    relationship = Media.get_relationship!(id)
    changeset = Media.change_relationship(relationship)
    render(conn, "edit.html", relationship: relationship, changeset: changeset)
  end

  def update(conn, %{"id" => id, "relationship" => relationship_params}) do
    relationship = Media.get_relationship!(id)

    case Media.update_relationship(relationship, relationship_params) do
      {:ok, relationship} ->
        conn
        |> put_flash(:info, "Relationship updated successfully.")
        |> redirect(to: Routes.relationship_path(conn, :show, relationship))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", relationship: relationship, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    relationship = Media.get_relationship!(id)
    {:ok, _relationship} = Media.delete_relationship(relationship)

    conn
    |> put_flash(:info, "Relationship deleted successfully.")
    |> redirect(to: Routes.relationship_path(conn, :index))
  end
end
