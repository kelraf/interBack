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

    alias InterBack.{Accounts, Stores, WarehouseProducts}

    defp createSuperUser do
        Accounts.create_user(%{
            name: "Raphael",
            email: "kelraf11746@gmail.com",
            password: "kelraf",
            role: 1,
            password_confirmation: "kelraf"
        })
    end

    defp createStore({:ok, %{id: id}}) do
        Stores.create_store(%{
            user_id: id,
            store_name: "Store one"
        })
        
    end

    defp createStoreAttendant do

        Accounts.create_user(%{
            name: "Store Attendant One",
            email: "kelraf@gmail.com",
            password: "kelraf",
            role: 3,
            password_confirmation: "kelraf"
        })
        
    end

    # defp createWarehouseProducts({:ok, %{user_id: user_id}}) do
    #     WarehouseProducts.create_warehouse_product(%{

    #     })
    # end

    def run() do

        createStoreAttendant()

        createSuperUser()
        |> createStore()
        |> IO.inspect
    end
    
end

Seeds.run()
