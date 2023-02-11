defmodule SuggestedWatchOrder.Repo.Migrations.CreateFilms do
  use Ecto.Migration

  def change do
    create table(:films) do
      add :title, :string
      add :description, :string
      add :release_date, :string
      add :poster_url, :string
      add :type, :string

      timestamps()
    end
  end
end
