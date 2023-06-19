defmodule ExamplePhoenixKratosWeb.KratosController do
  use ExamplePhoenixKratosWeb, :controller

  def session(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    conn
    |> flash_session()
    |> render(:session, layout: false)
  end

  @spec flash_session(Plug.Conn.t()) :: Plug.Conn.t()
  defp flash_session(conn) do
    case KratosPlug.session_valid?(conn) do
      true ->
        conn
        |> put_flash(:info, "Valid session found.")

      false ->
        conn
        |> put_flash(:error, "No valid session found.")
    end
  end
end
