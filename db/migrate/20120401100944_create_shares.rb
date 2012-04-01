class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.references :stock
      t.date :date_of_purchase
      t.date :date_of_sale
      t.integer :volume
      t.references :user

      t.timestamps
    end
    add_index :shares, :stock_id
    add_index :shares, :user_id
  end
end
