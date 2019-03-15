defmodule CurrencyWatch.CurrencyControllerTest do
  use CurrencyWatchWeb.ConnCase

  alias CurrencyWatch.Currency

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all currencies on index", %{conn: conn} do
    currency = Repo.insert! %Currency{
      code: "EUR",
      name: "Euro",
      flag: "eu"
    }
    currency
    |> Ecto.build_assoc(:exchange_rates, value: 0.858946, inserted_at: CurrencyWatch.Date.day_before(NaiveDateTime.utc_now))
    |> Repo.insert
    currency
    |> Ecto.build_assoc(:exchange_rates, value: 0.858023)
    |> Repo.insert
    currency
    |> Ecto.build_assoc(:exchange_rates, value: 0.858022)
    |> Repo.insert

    conn = get conn, Routes.currency_path(conn, :index)
    assert json_response(conn, 200) == [%{
      "id" => currency.id,
      "code" => "EUR",
      "name" => "Euro",
      "current_rate" => "0.858022",
      "last_rate" => "0.858946",
      "flag_url" => "http://localhost:4001/images/flags/eu.png",
    }]
  end
end
