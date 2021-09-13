  defmodule InterBack.Mailer do
    use Bamboo.Mailer, otp_app: :interBack
    import Bamboo.Email
    alias InterBack.Accounts.User

    defp confirm_email(email, code) do

        # new_email(
        #   to: "john@gmail.com",
        #   from: "support@myapp.com",
        #   subject: "Welcome to the app.",
        #   html_body: "<strong>Thanks for joining!</strong>",
        #   text_body: "Thanks for joining!"
        # )
    
        # or pipe using Bamboo.Email functions
        new_email()
        |> to(email)
        |> from("rafwambugu@gmail.com")
        |> subject("Confirm Confirmation Code #{code}")
        |> html_body("<strong>Email Confirmation Code: #{code} </strong>")
        |> text_body("Hello, We are test app, please confirm your email by resending this verification code")

    end

    def sendMail(%User{} = user, code) do
        
    end

end