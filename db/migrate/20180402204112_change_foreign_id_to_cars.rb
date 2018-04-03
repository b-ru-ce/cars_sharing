class ChangeForeignIdToCars < ActiveRecord::Migration
  def up
  	change_column :cars, :foreign_id, :string
  end

  def down
  	change_column :cars, :foreign_id, :integer
  end
end
