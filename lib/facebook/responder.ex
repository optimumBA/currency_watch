defmodule Facebook.Responder do
  alias CurrencyWatch.{Client, Request}

  @endpoint "https://graph.facebook.com/v2.6/me/messages"
  @access_token Application.get_env(:currency_watch, :facebook)[:access_token]

  def send_message(recipient_id, text) do
    respond(recipient_id, %{message: %{text: text}})
  end

  def mark_as_seen(recipient_id) do
    respond(recipient_id, %{sender_action: "mark_seen"})
  end

  def show_typing_indicator(recipient_id) do
    respond(recipient_id, %{sender_action: "typing_on"})
  end

  defp respond(recipient_id, data) do
    body = Map.merge(data, %{
      recipient: %{
        id: recipient_id,
      },
    })

    Request.new(:post, @endpoint, body, %{access_token: @access_token}, [{"Content-Type", "application/json"}])
    |> Client.send()
  end
end
