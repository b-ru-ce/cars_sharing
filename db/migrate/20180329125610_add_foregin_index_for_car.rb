class AddForeginIndexForCar < ActiveRecord::Migration
  def change
  	add_index :cars, [:foreign_id, :partner_id], :unique => true
  end
end
