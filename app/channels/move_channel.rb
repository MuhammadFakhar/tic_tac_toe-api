class MoveChannel < ApplicationCable::Channel
  def subscribed
    stream_from "move_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def select_tile(data)
    # Move.create(game: Game.first, tile: data['tile'].to_i)
  end
end