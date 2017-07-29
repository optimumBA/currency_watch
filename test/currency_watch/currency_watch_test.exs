defmodule CurrencyWatch.DateTest do
  use ExUnit.Case, async: true

  test "returns day before" do
    {:ok, datetime} = Ecto.DateTime.cast({{2017, 7, 29}, {0, 0, 0}})
    new_datetime = CurrencyWatch.Date.day_before(datetime)

    assert "2017-07-28 00:00:00" = Ecto.DateTime.to_string(new_datetime)
  end
end
