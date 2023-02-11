defmodule SuggestedWatchOrder.MediaTest do
  use SuggestedWatchOrder.DataCase

  alias SuggestedWatchOrder.Media

  describe "films" do
    alias SuggestedWatchOrder.Media.Film

    import SuggestedWatchOrder.MediaFixtures

    @invalid_attrs %{title: nil, type: nil}

    test "list_films/0 returns all films" do
      film = film_fixture()
      assert Media.list_films() == [film]
    end

    test "get_film!/1 returns the film with given id" do
      film = film_fixture()
      assert Media.get_film!(film.id) == film
    end

    test "create_film/1 with valid data creates a film" do
      valid_attrs = %{title: "some title", type: "some type"}

      assert {:ok, %Film{} = film} = Media.create_film(valid_attrs)
      assert film.title == "some title"
      assert film.type == "some type"
    end

    test "create_film/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_film(@invalid_attrs)
    end

    test "update_film/2 with valid data updates the film" do
      film = film_fixture()
      update_attrs = %{title: "some updated title", type: "some updated type"}

      assert {:ok, %Film{} = film} = Media.update_film(film, update_attrs)
      assert film.title == "some updated title"
      assert film.type == "some updated type"
    end

    test "update_film/2 with invalid data returns error changeset" do
      film = film_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_film(film, @invalid_attrs)
      assert film == Media.get_film!(film.id)
    end

    test "delete_film/1 deletes the film" do
      film = film_fixture()
      assert {:ok, %Film{}} = Media.delete_film(film)
      assert_raise Ecto.NoResultsError, fn -> Media.get_film!(film.id) end
    end

    test "change_film/1 returns a film changeset" do
      film = film_fixture()
      assert %Ecto.Changeset{} = Media.change_film(film)
    end
  end

  describe "relationships" do
    alias SuggestedWatchOrder.Media.Relationship

    import SuggestedWatchOrder.MediaFixtures

    @invalid_attrs %{type: nil}

    test "list_relationships/0 returns all relationships" do
      relationship = relationship_fixture()
      assert Media.list_relationships() == [relationship]
    end

    test "get_relationship!/1 returns the relationship with given id" do
      relationship = relationship_fixture()
      assert Media.get_relationship!(relationship.id) == relationship
    end

    test "create_relationship/1 with valid data creates a relationship" do
      valid_attrs = %{type: "some type"}

      assert {:ok, %Relationship{} = relationship} = Media.create_relationship(valid_attrs)
      assert relationship.type == "some type"
    end

    test "create_relationship/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Media.create_relationship(@invalid_attrs)
    end

    test "update_relationship/2 with valid data updates the relationship" do
      relationship = relationship_fixture()
      update_attrs = %{type: "some updated type"}

      assert {:ok, %Relationship{} = relationship} = Media.update_relationship(relationship, update_attrs)
      assert relationship.type == "some updated type"
    end

    test "update_relationship/2 with invalid data returns error changeset" do
      relationship = relationship_fixture()
      assert {:error, %Ecto.Changeset{}} = Media.update_relationship(relationship, @invalid_attrs)
      assert relationship == Media.get_relationship!(relationship.id)
    end

    test "delete_relationship/1 deletes the relationship" do
      relationship = relationship_fixture()
      assert {:ok, %Relationship{}} = Media.delete_relationship(relationship)
      assert_raise Ecto.NoResultsError, fn -> Media.get_relationship!(relationship.id) end
    end

    test "change_relationship/1 returns a relationship changeset" do
      relationship = relationship_fixture()
      assert %Ecto.Changeset{} = Media.change_relationship(relationship)
    end
  end
end
