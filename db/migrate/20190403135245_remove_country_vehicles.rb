class RemoveCountryVehicles < ActiveRecord::Migration[5.2]
  def up
    remove_column :vehicles, :color
    remove_column :vehicles, :brand
  end
  def down
    add_column :vehicles, :color, :string
    add_column :vehicles, :brand, :string
  end
end
