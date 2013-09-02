defmodule Dynodemo.Dynochat do
  @moduledoc "A module to manage chat channels, messages, and subscriptions."

  use GenServer.Behaviour

  def init(subscriber_list) do
    IO.puts "Starting Dynochat"
    {:ok, subscriber_list }
  end

  def handle_call({:subscribe, channel, conn}, _from, subscriber_list) do
    channel_list = [conn | (Dict.get(subscriber_list, channel) || [])]
    subscriber_list = Dict.put(subscriber_list, channel, channel_list)
    {:reply, {:ok, channel, channel_list}, subscriber_list }
  end

  def handle_call({:broadcast, channel, msg}, _from, subscriber_list) do
    channel_list = Dict.get(subscriber_list, channel) || []
    send_each(channel_list, msg)
    { :reply, :ok, subscriber_list }
  end

  def terminate(reason, _subscriber_list) do
    IO.puts "Dynochat terminated."
    IO.puts reason
  end

  defp send_each([], _msg) do
    nil
  end

  defp send_each([conn | conns], msg) do
    conn.chunk(msg)
    send_each(conns, msg)
  end

end