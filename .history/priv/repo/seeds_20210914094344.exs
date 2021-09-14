# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     InterBack.Repo.insert!(%InterBack.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


defmodule Seeds do

    alias InterBack.{Accounts, Stores}

    defp createSuperUser do
        Accounts.create_user(%{
            name: "Raphael",
            email: "kelraf11746@gmail.com",
            password: "kelraf",
            role: 1,
            password_confirmation: "kelraf"
        })
    end

    defp createStore(%{id: index}) do
        Stores.create_store(%{
            user_id: 1,
            store_name: "Store one"
        })
        
    end

    def run() do
        createSuperUser()
        |> IO.inspect
        |> Map.from_struct
        |> IO.inspect
        # |> Map.drop([:__meta__])
        # |> createStore()
    end
    
end

Seeds.run()
