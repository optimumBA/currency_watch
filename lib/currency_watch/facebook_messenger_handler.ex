defmodule CurrencyWatch.FacebookMessengerHandler do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def stop() do
    GenServer.stop(__MODULE__)
  end

  def handle_message(sender_id, message) do
    GenServer.cast(__MODULE__, {:handle_message, sender_id, message})
  end

  # Callbacks

  def init(_args) do
    {:ok, []}
  end

  @page_access_token Application.get_env(:currency_watch, :facebook)[:access_token]
  def handle_cast({:handle_message, sender_id, message}, _state) do
    endpoint = "https://graph.facebook.com/v2.6/me/messages?access_token=" <> @page_access_token

    {:ok, body} = Poison.encode(%{
      recipient: %{
        id: sender_id,
      },
      sender_action: "mark_seen",
    })

    HTTPoison.post(endpoint, body, [{"Content-Type", "application/json"}])

    {:noreply, nil}
  end
end
