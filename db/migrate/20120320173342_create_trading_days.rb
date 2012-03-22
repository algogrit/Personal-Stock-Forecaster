class CreateTradingDays < ActiveRecord::Migration
  def change
    create_table :trading_days do |t|
      t.integer :opening
      t.integer :closing
      t.integer :days_high
      t.integer :days_low
      t.integer :volume
      t.references :stock

      t.timestamps
    end
    add_index :trading_days, :stock_id
  end
end
