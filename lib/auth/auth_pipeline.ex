defmodule InterBack.Guardian.AuthPipeline do
    use Guardian.Plug.Pipeline, otp_app: :interback,

    module: InterBack.Guardian,
    error_handler: InterBack.AuthErrorHandler

    plug Guardian.Plug.VerifyHeader, scheme: "Bearer"
    plug Guardian.Plug.EnsureAuthenticated
    plug Guardian.Plug.LoadResource

end
