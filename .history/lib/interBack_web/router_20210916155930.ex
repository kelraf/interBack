defmodule InterBackWeb.Router do
  use InterBackWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    
  end

  pipeline :jwt_auth do
    plug(InterBack.Guardian.AuthPipeline)
  end

  scope "/", InterBackWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", InterBackWeb do
    pipe_through :api
    plug CORSPlug

    post "/users/auth/register", UserController, :create
    post "/users/auth/login", UserController, :login
  end

  scope "/api", InterBackWeb do
    pipe_through [:api, :jwt_auth]

    get "/users", UserController, :index
    get "/users/:id", UserController, :show
    delete "/users/:id", UserController, :delete
    resources "/stores", StoreController
    resources "/storeattendants", StoreattendantController
    resources "/warehouseproducts", WarehouseProductController
    resources "/storeproducts", StoreProductController
    resources "/storesales", StoreSaleController

    get "/reorders", ReorderController, :index
    get "/reorders/:id", ReorderController, :show
    put "/reorders/:id", ReorderController, :update

  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: InterBackWeb.Telemetry
    end
  end
end