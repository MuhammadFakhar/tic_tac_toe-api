class MovesController < ApplicationController
  def index
    moves = Move.all
  end

  def create
    create_move = Move.new(game_board: GameBoard.first, tile: params[:tile].to_i)

    if create_move.save
      winner, player = create_move.perform_move
      if winner
       render json: { player: player }, status: :created
      end
    else
      render json: render_errors(create_move), status: :ok
    end
  end

  def reset_board
    Move.destroy_all
  end
end
