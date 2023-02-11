defmodule SuggestedWatchOrder.Media.Film do
  use Ecto.Schema
  import Ecto.Changeset

  schema "films" do
    field :description, :string
    field :poster_url, :string
    field :release_date, :string
    field :title, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:title, :description, :release_date, :poster_url, :type])
    |> validate_required([:title, :description, :release_date, :poster_url, :type])
  end
end
