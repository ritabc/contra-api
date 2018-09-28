class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :description
      t.timestamps
    end
    add_column :dance_moves, :ending_position_id, :integer
    add_foreign_key :dance_moves, :positions, column: :ending_position_id
  end
end
