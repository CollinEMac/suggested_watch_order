defmodule SuggestedWatchOrder.MediaFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SuggestedWatchOrder.Media` context.
  """

  @doc """
  Generate a film.
  """
  def film_fixture(attrs \\ %{}) do
    {:ok, film} =
      attrs
      |> Enum.into(%{
        description: "some description",
        poster_url: "some poster_url",
        release_date: "some release_date",
        title: "some title",
        type: "some type"
      })
      |> SuggestedWatchOrder.Media.create_film()

    film
  end

  @doc """
  Generate a relationship.
  """
  def relationship_fixture(attrs \\ %{}) do
    {:ok, relationship} =
      attrs
      |> Enum.into(%{
        type: "some type"
      })
      |> SuggestedWatchOrder.Media.create_relationship()

    relationship
  end
end
