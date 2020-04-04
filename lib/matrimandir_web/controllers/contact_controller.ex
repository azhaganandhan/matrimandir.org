defmodule MatrimandirWeb.ContactController do
    alias Matrimandir.{Email, Mailer}
    use MatrimandirWeb, :controller

    def index(conn, _params) do
      render(conn, "index.html")
    end

    def contact(conn, params) do
      name = params["name"]
      email = params["email"]
      message = params["message"]
      Email.getting_in_touch_mail(name, email, message) |> Mailer.deliver_now()
      conn
      |> put_flash(:info, "You will have a response soon")
      |> render("index.html")
    end

end
