defmodule SuggestedWatchOrderWeb.FilmController do
  use SuggestedWatchOrderWeb, :controller

  alias SuggestedWatchOrder.Media
  alias SuggestedWatchOrder.Media.Film

  def index(conn, params) do
    films = Media.list_films(params)
    render(conn, "index.html", films: films)
  end

  def new(conn, _params) do
    changeset = Media.change_film(%Film{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"film" => film_params}) do
    case Media.create_film(film_params) do
      {:ok, film} ->
        conn
        |> put_flash(:info, "Film created successfully.")
        |> redirect(to: Routes.film_path(conn, :show, film))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    film = Media.get_film!(id)
    render(conn, "show.html", film: film)
  end

  def edit(conn, %{"id" => id}) do
    film = Media.get_film!(id)
    changeset = Media.change_film(film)
    render(conn, "edit.html", film: film, changeset: changeset)
  end

  def update(conn, %{"id" => id, "film" => film_params}) do
    film = Media.get_film!(id)

    case Media.update_film(film, film_params) do
      {:ok, film} ->
        conn
        |> put_flash(:info, "Film updated successfully.")
        |> redirect(to: Routes.film_path(conn, :show, film))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", film: film, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    film = Media.get_film!(id)
    {:ok, _film} = Media.delete_film(film)

    conn
    |> put_flash(:info, "Film deleted successfully.")
    |> redirect(to: Routes.film_path(conn, :index))
  end
end
