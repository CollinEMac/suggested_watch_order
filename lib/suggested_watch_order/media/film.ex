defmodule SuggestedWatchOrder.Media.Film do
  use Ecto.Schema
  import Ecto.Changeset

  schema "films" do
    field :title, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(film, attrs) do
    film
    |> cast(attrs, [:title, :type])
    |> validate_required([:title, :type])
  end
end
