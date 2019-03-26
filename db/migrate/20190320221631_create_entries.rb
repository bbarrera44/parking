class CreateEntries < ActiveRecord::Migration[5.2]
  def up
    create_table :entries do |t|
      t.integer :vehicle_id
      t.integer :rate_id
      t.integer :parking_id
      t.datetime :entry_time
      t.datetime :exit_time
      t.integer :total_time
      t.float :price

      t.timestamps
    end
  end
  def dow
    drop_table :entries
  end
end
