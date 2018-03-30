class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.float :latitude, {:precision=>10, :scale=>6}
      t.float :longitude, {:precision=>10, :scale=>6}
      t.integer :partner_id
      t.string :reg_number
      t.integer :status
      t.integer :fuel_max
      t.integer :fuel
      t.integer :mileage
      t.integer :foreign_id

      t.timestamps null: false
    end
  end
end
