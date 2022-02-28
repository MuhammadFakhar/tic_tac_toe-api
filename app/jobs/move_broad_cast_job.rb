class MoveBroadcastJob < ApplicationJob
  queue_as :default

  def perform(move)
    winner = GameBoard.check_winner if move.position >=4
    tie = (move.position >= 9)
    ActionCable.server.broadcast('move_channel',
      move: move, winner: winner, tie: tie)

    Move.destroy_all if winner || tie
  end
end
