class AddBecketFormationBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :dances, :is_becket, :boolean
  end
end
