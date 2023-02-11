defmodule SuggestedWatchOrder.Repo.Migrations.CreateRelationships do
  use Ecto.Migration

  def change do
    create table(:relationships) do
      add :type, :string
      add :from_film, references(:films, on_delete: :nothing)
      add :to_film, references(:films, on_delete: :nothing)

      timestamps()
    end

    create index(:relationships, [:from_film])
    create index(:relationships, [:to_film])
  end
end
