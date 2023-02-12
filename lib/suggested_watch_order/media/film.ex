defmodule SuggestedWatchOrder.Media.Film do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "films" do
    field :title, :string
    field :type, :string

    timestamps()
  end

  def search(query, search_term) do
    wildcard_search = "%#{search_term}%"

    from film in query,
    where: ilike(film.title, ^wildcard_search)
    # or_where: ilike(film.summary, ^wildcard_search)
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:title, :type])
    |> validate_required([:title, :type])
  end
end
