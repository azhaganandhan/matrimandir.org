defmodule Matrimandir.Email do
  import Bamboo.Email

  def getting_in_touch_mail(name, email, message) do
    new_email(
      to: "matrimandir@auroville.org.in",
      from: email,
      subject: name <> " has sent a message",
      html_body: "",
      text_body: message
    )
  end
end
