defmodule InterBack.Email do
    import Bamboo.Email
  
    def authCodeMail() do
      new_email(
        to: "john@example.com",
        from: "support@myapp.com",
        subject: "Welcome to the app.",
        html_body: "<strong>Thanks for joining!</strong>",
        text_body: "Thanks for joining!"
      )
    end
  end