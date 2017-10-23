defmodule CurrencyWatch.WebhookController do
  use CurrencyWatch.Web, :controller

  alias CurrencyWatch.FacebookMessengerHandler

  def handle(conn, %{"object" => "page", "entry" => entries}) do
    Enum.map(entries, &handle_entry/1)
    send_resp(conn, 200, "")
  end
  def handle(conn, _params), do: send_resp(conn, 404, "")

  @verify_token Application.get_env(:currency_watch, :facebook)[:verify_token]
  def verify(conn, %{"hub.mode" => "subscribe", "hub.verify_token" => @verify_token, "hub.challenge" => challenge}), do: send_resp(conn, 200, challenge)
  def verify(conn, _params), do: send_resp(conn, 403, "")

  defp handle_entry(%{"messaging" => [%{"sender" => %{"id" => sender_id}, "message" => message}]}) do
    FacebookMessengerHandler.handle_message(sender_id, message)
  end
  defp handle_entry(%{"messaging" => [%{"postback" => _postback}]}) do
    # handle postback
  end
end
