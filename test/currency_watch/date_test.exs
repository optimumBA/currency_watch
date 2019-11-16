defmodule CurrencyWatch.DateTest do
  use ExUnit.Case, async: true

  test "returns day before" do
    {:ok, datetime} = NaiveDateTime.from_erl({{2017, 7, 29}, {0, 0, 0}})

    assert ~N[2017-07-28 00:00:00] == CurrencyWatch.Date.day_before(datetime)
  end
end
