defmodule Facebook.MessageSender do
  alias CurrencyWatch.{Client, Request}

  @endpoint "https://graph.facebook.com/v2.6/me/messages"
  @access_token Application.get_env(:currency_watch, :facebook)[:access_token]

  def mark_as_seen(sender_id) do
    body = %{
      recipient: %{
        id: sender_id,
      },
      sender_action: "mark_seen",
    }

    Request.new(:post, @endpoint, body, %{access_token: @access_token}, [{"Content-Type", "application/json"}])
    |> Client.send()
  end
end
