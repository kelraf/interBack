defmodule InterBack.Auth do
    alias InterBack.Accounts
    alias InterBack.Accounts.User
    alias InterBack.Repo
    alias InterBack.Guardian

    defp getUserByEmail(%{"email" => email}) do
        user = Repo.get_by %User{}, email: email
        case user do
            nil ->
                {:error, "Invalid User Credentials 1"}
            _ -> 
                {:ok, user}    
        end
    end

    defp passwordVerify({:ok, user}, password) do
        if Comeonin.Ecto.Password.valid?(password, user.password) do
            {:ok, user}
        else
            {:error, "Invalid User Credentials 2"}
        end
    end

    defp passwordVerify({:error, msg}, password) do
        {:error, msg}
    end

    defp passwordVerify(_) do
        throw("Oops Error Occured At Password Verify")
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

    defp encodeUserData(_) do
        throw("Oops Error Occured At User Data Encoding")
    end

    def login(%{"password" => password} = userData) do
        userData
        |> getUserByEmail()
        |> passwordVerify(password)
        |> encodeUserData()
    end
end