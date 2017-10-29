defmodule Facebook.Worker do
  use GenServer

  alias CurrencyWatch.{Identity, Repo}
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
    unless identity = Repo.get_by(Identity, token: sender_id) do
      changeset = Identity.changeset(%Identity{token: sender_id})
      {:ok, identity} = Repo.insert(changeset)
    end
    response = MessageProcessor.create_response(identity, text)
    Responder.send_message(sender_id, response)

    {:noreply, nil}
  end
end
