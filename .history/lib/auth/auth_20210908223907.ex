defmodule InterBack.Auth do
    alias InterBack.Accounts
    alias InterBack.Accounts.User
    alias InterBack.Repo

    defp getUserByEmail(%{"email" => email}) do
        user = Repo.get_by %User{}, email: email
        case user do
            nil ->
                {:error, "No user available with the provided email"}
            _ -> 
                {:ok, user}    
        end
    end

    defp passwordVerify({:ok, user}, password) do
        
    end

    defp passwordVerify({:error, msg}, password) do
        {:error, msg}
    end

    defp passwordVerify(_) do
        throw("Oops Error Occured At Password Verify")
    end

    def login(%{"email" => email, "password" => password}) do
        
    end
end