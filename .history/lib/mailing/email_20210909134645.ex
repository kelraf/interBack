  defmodule InterBack.Mailer do
    use Bamboo.Mailer, otp_app: :interBack
    import Bamboo.Email
    alias InterBack.Accounts.User

    defp confirm_email(email, code) do
    
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