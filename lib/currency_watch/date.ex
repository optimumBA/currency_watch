defmodule CurrencyWatch.Date do
  def day_before(datetime) do
    datetime
    |> NaiveDateTime.add(-24 * 60 * 60)
    |> NaiveDateTime.truncate(:second)
  end
end
