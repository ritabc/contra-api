class AddProgressionBooleanToDanceMoves < ActiveRecord::Migration[5.2]
  def change
    add_column :dance_moves, :is_progression, :boolean
  end
end
