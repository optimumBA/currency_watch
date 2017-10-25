defmodule Facebook.Worker do
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

  def handle_cast({:handle_message, sender_id, _message}, _state) do
    Facebook.MessageSender.mark_as_seen(sender_id)

    {:noreply, nil}
  end
end
