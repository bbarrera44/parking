class CreateRates < ActiveRecord::Migration[5.2]
  def up
    create_table :rates do |t|
      t.string :name
      t.integer :value
      t.date :date_begin
      t.date :date_end

      t.timestamps
    end
  end
  def down
    drop_table :rates
  end
end
