defmodule Facebook.ResponderTest do
  use ExUnit.Case, async: true

  alias CurrencyWatch.Client.InMemoryClient
  alias CurrencyWatch.{Request, Response}

  test "sends message" do
    response = %Response{status: :ok, body: %{
      "recipient_id" => "1008372609250235",
      "message_id" => "mid.1456970487936:c34767dfe57ee6e339",
    }}
    InMemoryClient.push(response)

    assert Facebook.Responder.send_message(1008372609250235, "message text") == response
    assert %Request{
      method: :post,
      endpoint: "https://graph.facebook.com/v2.6/me/messages",
      params: %{access_token: _},
      body: %{
        recipient: %{
          id: 1008372609250235,
        },
        message: %{
          text: "message text",
        },
      },
      headers: [{"Content-Type", "application/json"}]
    } = InMemoryClient.pop()
  end

  test "marks message as seen" do
    response = %Response{status: :ok, body: %{
      "recipient_id" => "1340752069386539"
    }}
    InMemoryClient.push(response)

    assert Facebook.Responder.mark_as_seen(1340752069386539) == response
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

  test "shows typing indicator" do
    response = %Response{status: :ok, body: %{
      "recipient_id" => "1340752069386539"
    }}
    InMemoryClient.push(response)

    assert Facebook.Responder.show_typing_indicator(1340752069386539) == response
    assert %Request{
      method: :post,
      endpoint: "https://graph.facebook.com/v2.6/me/messages",
      params: %{access_token: _},
      body: %{
        recipient: %{
          id: 1340752069386539,
        },
        sender_action: "typing_on",
      },
      headers: [{"Content-Type", "application/json"}]
    } = InMemoryClient.pop()
  end
end
