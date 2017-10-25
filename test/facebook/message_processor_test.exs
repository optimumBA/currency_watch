defmodule Facebook.MessageProcessorTest do
  use ExUnit.Case, async: true

  alias Facebook.MessageProcessor

  test "responds to 💩 with 🙈" do
    assert MessageProcessor.create_response("💩") == "🙈"
  end

  test "responds to unrecognized commands" do
    assert MessageProcessor.create_response("!") == "Unrecognized command"
  end
end
