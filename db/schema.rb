# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120325164503) do

  create_table "predictions", :force => true do |t|
    t.float    "value"
    t.date     "for_date"
    t.integer  "trading_day_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "predictions", ["trading_day_id"], :name => "index_predictions_on_trading_day_id"

  create_table "stocks", :force => true do |t|
    t.string   "stock_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trading_days", :force => true do |t|
    t.float    "opening"
    t.float    "closing"
    t.float    "high"
    t.float    "low"
    t.integer  "volume"
    t.date     "date_of_trade"
    t.integer  "stock_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "trading_days", ["stock_id"], :name => "index_trading_days_on_stock_id"

end
