defmodule SuggestedWatchOrder.Repo.Migrations.RemoveFieldsFromFilms do
  use Ecto.Migration

  def change do
    alter table(:films) do
      remove :description
      remove :poster_url
      remove :release_date
    end
  end
end
