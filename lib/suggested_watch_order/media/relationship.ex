defmodule SuggestedWatchOrder.Media.Relationship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "relationships" do
    field :type, :string
    field :from_film, :id
    field :to_film, :id

    timestamps()
  end

  @doc false
  def changeset(relationship, attrs) do
    relationship
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
