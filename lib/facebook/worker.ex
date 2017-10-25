defmodule Facebook.Worker do
  use GenServer

  alias Facebook.{MessageProcessor, Responder}

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

  def handle_cast({:handle_message, sender_id, %{"text" => text}}, _state) do
    Responder.mark_as_seen(sender_id)
    Responder.show_typing_indicator(sender_id)
    response = MessageProcessor.create_response(text)
    Responder.send_message(sender_id, response)

    {:noreply, nil}
  end
end
