defmodule Facebook.MessageProcessor do
  def create_response("💩"), do: "🙈"
  def create_response(_), do: "Unrecognized command"
end
