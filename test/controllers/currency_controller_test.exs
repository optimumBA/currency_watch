defmodule CurrencyWatch.CurrencyControllerTest do
  use CurrencyWatch.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all currencies on index", %{conn: conn} do
    currency = insert_currency(%{
      code: "EUR",
      name: "Euro",
      flag: "eu"
    })
    insert_exchange_rate(currency, %{value: 0.858946})
    insert_exchange_rate(currency, %{value: 0.858023})
    insert_exchange_rate(currency, %{value: 0.858022})

    conn = get conn, currency_path(conn, :index)
    assert json_response(conn, 200) == [%{
      "id" => currency.id,
      "code" => "EUR",
      "name" => "Euro",
      "current_rate" => "0.858022",
      "last_rate" => "0.858023",
      "flag_url" => "http://localhost:4001/images/flags/eu.png",
    }]
  end
end
