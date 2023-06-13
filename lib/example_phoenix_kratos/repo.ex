defmodule ExamplePhoenixKratos.Repo do
  use Ecto.Repo,
    otp_app: :example_phoenix_kratos,
    adapter: Ecto.Adapters.SQLite3
end
