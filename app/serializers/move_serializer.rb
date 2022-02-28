class MoveSerializer
  include FastJsonapi::ObjectSerializer

  attributes :tile, :position, :game_board

  belongs_to :game_board
end
