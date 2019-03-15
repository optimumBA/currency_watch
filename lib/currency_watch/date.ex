defmodule CurrencyWatch.Date do
  def day_before(datetime) do
    {:ok, new_datetime} = datetime
    |> NaiveDateTime.to_erl
    |> :calendar.datetime_to_gregorian_seconds
    |> Kernel.-(24 * 60 * 60)
    |> :calendar.gregorian_seconds_to_datetime
    |> NaiveDateTime.from_erl

    new_datetime
  end
end
