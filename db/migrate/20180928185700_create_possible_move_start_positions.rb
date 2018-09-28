class CreatePossibleMoveStartPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :possible_move_start_positions do |t|
      t.belongs_to :position, index: true
      t.belongs_to :move, index: true
      t.timestamps
    end
  end
end
