defmodule CurrencyWatch.CurrencyControllerTest do
  use CurrencyWatch.ConnCase

  alias CurrencyWatch.Currency

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all currencies on index", %{conn: conn} do
    currency = Repo.insert! %Currency{
      code: "USD",
      name: "United States Dollar",
      flag: "us"
    }

    conn = get conn, currency_path(conn, :index)
    assert json_response(conn, 200) == [%{
      "id" => currency.id,
      "code" => "USD",
      "name" => "United States Dollar",
      "flag_url" => "http://localhost:4001/images/flags/us.png",
    }]
  end
end
