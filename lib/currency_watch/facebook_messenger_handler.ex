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

  def handle_cast({:handle_message, sender_id, message}, _state) do
    {:noreply, nil}
  end
end
