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
                {:ok, }    
        end
    end
end