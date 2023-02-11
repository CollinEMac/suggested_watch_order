defmodule SuggestedWatchOrderWeb.FilmControllerTest do
  use SuggestedWatchOrderWeb.ConnCase

  import SuggestedWatchOrder.MediaFixtures

  @create_attrs %{description: "some description", poster_url: "some poster_url", release_date: "some release_date", title: "some title", type: "some type"}
  @update_attrs %{description: "some updated description", poster_url: "some updated poster_url", release_date: "some updated release_date", title: "some updated title", type: "some updated type"}
  @invalid_attrs %{description: nil, poster_url: nil, release_date: nil, title: nil, type: nil}

  describe "index" do
    test "lists all films", %{conn: conn} do
      conn = get(conn, Routes.film_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Films"
    end
  end

  describe "new film" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.film_path(conn, :new))
      assert html_response(conn, 200) =~ "New Film"
    end
  end

  describe "create film" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.film_path(conn, :create), film: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.film_path(conn, :show, id)

      conn = get(conn, Routes.film_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Film"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.film_path(conn, :create), film: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Film"
    end
  end

  describe "edit film" do
    setup [:create_film]

    test "renders form for editing chosen film", %{conn: conn, film: film} do
      conn = get(conn, Routes.film_path(conn, :edit, film))
      assert html_response(conn, 200) =~ "Edit Film"
    end
  end

  describe "update film" do
    setup [:create_film]

    test "redirects when data is valid", %{conn: conn, film: film} do
      conn = put(conn, Routes.film_path(conn, :update, film), film: @update_attrs)
      assert redirected_to(conn) == Routes.film_path(conn, :show, film)

      conn = get(conn, Routes.film_path(conn, :show, film))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, film: film} do
      conn = put(conn, Routes.film_path(conn, :update, film), film: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Film"
    end
  end

  describe "delete film" do
    setup [:create_film]

    test "deletes chosen film", %{conn: conn, film: film} do
      conn = delete(conn, Routes.film_path(conn, :delete, film))
      assert redirected_to(conn) == Routes.film_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.film_path(conn, :show, film))
      end
    end
  end

  defp create_film(_) do
    film = film_fixture()
    %{film: film}
  end
end
