defmodule InterBack.Email do
    import Bamboo.Email
  
    def authCodeMail() do
    #   new_email(
    #     to: "john@example.com",
    #     from: "support@myapp.com",
    #     subject: "Welcome to the app.",
    #     html_body: "<strong>Thanks for joining!</strong>",
    #     text_body: "Thanks for joining!"
    #   )

        new_email()
        |> to("kelraf11746@gmail.com")
        |> from("rafwambugu@gmail.com")
        |> subject("Confirm Confirmation Code 9904940")
        |> html_body("<strong>Email Confirmation Code: 949488 </strong>")
        |> text_body("Hello, We are test app, please confirm your email by resending this verification code")

    end
  end