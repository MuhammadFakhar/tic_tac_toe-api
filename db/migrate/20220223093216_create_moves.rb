class CreateMoves < ActiveRecord::Migration[6.1]
  def change
    create_table :moves do |t|
      t.integer :tile
      t.integer :position
      t.references :game_board, foreign_key: true

      t.timestamps
    end
  end
end
