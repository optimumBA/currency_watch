defmodule CurrencyWatch.Router do
  use CurrencyWatch.Web, :router

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

  scope "/", CurrencyWatch do
    pipe_through :api

    resources "/currencies", CurrencyController, only: [:index]
  end
end
