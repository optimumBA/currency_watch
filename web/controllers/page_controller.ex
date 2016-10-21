defmodule CurrencyWatch.PageController do
  use CurrencyWatch.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
