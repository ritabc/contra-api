class AddOutCouplesWaitingPositionBoolean < ActiveRecord::Migration[5.2]
  def change
    add_column :dances, :out_couples_waiting_position, :string
  end
end
