defmodule ExamplePhoenixKratosWeb.Router do
  alias KratosPlug.Plugs.KratosNativePipeline
  use ExamplePhoenixKratosWeb, :router

  @kratos_defaults [
    {:kratos_base_url, "https://optimistic-curran-64ebdafquq.projects.oryapis.com"}
  ]

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {ExamplePhoenixKratosWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :authenticated_browser do
    plug(KratosNativePipeline, @kratos_defaults)
    plug(:browser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :authenticated_api do
    plug(KratosNativePipeline, @kratos_defaults)
    plug(:api)
  end

  scope "/", ExamplePhoenixKratosWeb do
    pipe_through(:browser)

    get("/", PageController, :home)
  end

  scope "/kratos", ExamplePhoenixKratosWeb do
    pipe_through(:authenticated_browser)

    get("/session", KratosController, :session)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExamplePhoenixKratosWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:example_phoenix_kratos, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: ExamplePhoenixKratosWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
