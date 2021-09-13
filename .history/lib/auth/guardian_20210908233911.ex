defmodule InterBack.Guardian do
    use Guardian, otp_app: :interBack

    alias Systemdev.Accounts

    def subject_for_token(resource, _claims) do
        sub = to_string(resource.id)
        {:ok, sub}
    end

    def subject_for_token(_, _) do
        {:error, "Internal Application error 1"}
    end

    def resource_from_claims(claims) do
        id = claims["sub"]
        resource = InterBack.Accounts.get_user! id
        {:ok, resource}
    end

    def resource_from_claims(_claims) do
        {:error, "Internal Application error 2"}
    end
end