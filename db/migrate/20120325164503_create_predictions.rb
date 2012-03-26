class CreatePredictions < ActiveRecord::Migration
  def change
    create_table :predictions do |t|
      t.integer :value
      t.date :for_date
      t.references :trading_day

      t.timestamps
    end
    add_index :predictions, :trading_day_id
  end
end
