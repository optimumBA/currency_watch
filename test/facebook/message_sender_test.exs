defmodule Facebook.MessageSenderTest do
  use ExUnit.Case, async: true

  alias CurrencyWatch.Client.InMemoryClient
  alias CurrencyWatch.{Request, Response}

  test "marks message as seen" do
    response = %Response{status: :ok, body: %{
      "recipient_id" => "1340752069386539"
    }}
    InMemoryClient.push(response)

    assert Facebook.MessageSender.mark_as_seen(1340752069386539) == response

    assert %Request{
      method: :post,
      endpoint: "https://graph.facebook.com/v2.6/me/messages",
      params: %{access_token: _},
      body: %{
        recipient: %{
          id: 1340752069386539,
        },
        sender_action: "mark_seen",
      },
      headers: [{"Content-Type", "application/json"}]
    } = InMemoryClient.pop()
  end
end
