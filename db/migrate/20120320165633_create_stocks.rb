class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :stock_id
      t.string :name

      t.timestamps
    end
  end
end
