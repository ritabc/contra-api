class CreateDances < ActiveRecord::Migration[5.2]
  def change
    create_table :dances do |t|
      t.string :name
      t.string :writer
      t.text :description
    end
  end
end
