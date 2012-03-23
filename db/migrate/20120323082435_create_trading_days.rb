class CreateTradingDays < ActiveRecord::Migration
  def change
    create_table :trading_days do |t|
      t.integer :opening
      t.integer :closing
      t.integer :high
      t.integer :low
      t.integer :volume
      t.date :date_of_trade
      t.references :stock

      t.timestamps
    end
    add_index :trading_days, :stock_id
  end
end
