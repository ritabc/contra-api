class CreateDanceMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :dance_moves do |t|
      t.belongs_to :dance, index: true
      t.belongs_to :move, index: true
      t.integer :number_in_dance
      t.timestamps
    end
    add_column :dances, :created_at, :datetime, null: false
    add_column :dances, :updated_at, :datetime, null: false
    add_column :moves, :created_at, :datetime, null: false
    add_column :moves, :updated_at, :datetime, null: false
  end
end
