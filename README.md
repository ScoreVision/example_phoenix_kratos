# ExamplePhoenixKratos

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Ory Test Project

<https://optimistic-curran-64ebdafquq.projects.oryapis.com/ui>
Project name: `optimistic-curran-64ebdafquq`

## Setup

* Setup new ory project
* Download ory CLI
* Run ory tunnel
  * `ory tunnel http://localhost:4000 --dev --port 3000 --project optimistic-curran-64ebdafquq`
  * Replace the example ory project name.
  * Ory proxy wants to listen on tcp/4000 by default. This is also the default phoenix port so make sure the proxy uses tcp/3000 instead.
* Run example_phoenix_kratos project, `mix phx.server`.
* Navigate to <http://localhost:3000/ui/login>
* The login page will redirect to the phoenix app.
* Navigate to <http://localhost:4000/kratos/session>
* Authenticated users will see their session in JSON format, and a flash stating the session is valid.

## Integration Steps

A simple phoenix framework hello_world project was used as the base. A new controller for returning the Kratos session was added. Routes are protected by using the `KratosPlug.Plugs.EnsureAuthenticated` module.
