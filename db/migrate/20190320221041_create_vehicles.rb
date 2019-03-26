class CreateVehicles < ActiveRecord::Migration[5.2]
  def up
    create_table :vehicles do |t|
      t.string :plate
      t.string :color
      t.string :brand
      t.integer :parking_id

      t.timestamps
    end
  end
  def down
    drop_table :vehicles
  end
end
