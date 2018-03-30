class SetDefaultValueForStatusCar < ActiveRecord::Migration
  def up
  	change_column :cars, :status, :integer, default: 0, null: false
  end

  def down
  	change_column :cars, :status, :integer, default: nil, null: true
  end
end
