defmodule SuggestedWatchOrder.Repo do
  use Ecto.Repo,
    otp_app: :suggested_watch_order,
    adapter: Ecto.Adapters.Postgres
end
