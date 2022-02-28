class GameBoard < ApplicationRecord
  VALID_WINNING_COMBINATIONS = [
    [1,2,3], [4,5,6], [7,8,9],
    [1,4,7], [2,5,8], [3,6,9],
    [1,5,9], [3,5,7]
  ]

  has_many :moves, -> { order("position ASC") }

  def self.check_winner
    moves = Move.all
    even_moves = moves.select do |m|
      m.position.even?
    end.pluck(:tile)

    odd_moves = moves.select do |m|
      m.position.odd?
    end.pluck(:tile)

    winner = VALID_WINNING_COMBINATIONS.select do |array|
      (array - even_moves).empty? || (array - odd_moves).empty?
    end.any?

    player = (Move.last.position % 2).eql?(0) ? 'PLAYER 2 WINS THE GAME' : 'PLAYER 1 WINS THE GAME'
    [winner, player]
  end
end
