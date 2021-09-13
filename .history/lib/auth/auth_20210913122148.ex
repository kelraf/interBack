defmodule InterBack.Auth do
    alias InterBack.Accounts.User
    alias InterBack.Repo
    alias InterBack.Guardian

    defp getUserByEmail(%{"email" => email}) do
        user = Repo.get_by User, email: email
        case user do
            nil ->
                {:error, "Invalid User Credentials 1"}
            _ -> 
                {:ok, user}    
        end
    end

    defp passwordVerify({:ok, %User{} = user}, password) do
        if Comeonin.Bcrypt.checkpw(password, user.password) do
            {:ok, user}
        else
            {:error, "Invalid User Credentials 2"}
        end
    end

    defp passwordVerify({:error, msg}, _password) do
        {:error, msg}
    end

    defp encodeUserData({:ok, user}) do
        case Guardian.encode_and_sign user do
            {:ok, token, _claims} ->
                {:ok, user, token}
            {:error, msg} ->
                {:error, msg}
        end
    end

    defp encodeUserData({:error, msg}) do
        {:error, msg}
    end
    
    def login(%{"password" => password} = userData) do
        userData
        |> getUserByEmail()
        |> passwordVerify(password)
        |> encodeUserData()
    end
    # Sendgrid Password
    # winraf@11746-Winraf@11746
end