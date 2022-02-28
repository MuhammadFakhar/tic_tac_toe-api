class Move < ApplicationRecord
  belongs_to :game_board
  acts_as_list scope: :game_board

  validates :tile, uniqueness: true, presence: true,
    numericality: { only_integer: true, less_than: 10,
                    greater_than: 0, message: 'Position limit exceede' }

  def perform_move
    winner, player = GameBoard.check_winner if self.position > 4

    tie = (self.position == 9)
    player = 'NO WIN, GAME DRAWS' if tie

    if winner || tie
      Move.destroy_all 
      return [true, player]
    else
      return false
    end
  end
end
