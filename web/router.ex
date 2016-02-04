defmodule ZacnePrzedszkoleApiElixir.Router do
  use ZacnePrzedszkoleApiElixir.Web, :router

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

  scope "/schools", ZacnePrzedszkoleApiElixir do
    pipe_through :api

    get "/locations", SchoolController, :locations
    get "/ranking", SchoolController, :ranking
    get "/search", SchoolController, :search
  end

  scope "/", ZacnePrzedszkoleApiElixir do
    pipe_through :api

    resources "/schools", SchoolController, only: [:index, :show] do
      resources "/rates", RateController, only: [:create]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", ZacnePrzedszkoleApiElixir do
  #   pipe_through :api
  # end
end
