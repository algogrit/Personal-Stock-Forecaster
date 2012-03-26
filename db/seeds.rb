# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_stock = Stock.find_or_create_by_stock_id({stock_id: "12345", name: "sample"})
sample_stock1 = Stock.find_or_create_by_stock_id({stock_id: "12346", name: "sample"})

sample_stock.trading_days.find_or_create_by_date_of_trade({opening: 200, closing: 300, high: 400, low: 50, volume: 100000, date_of_trade: "2012-03-26"})
sample_stock1.trading_days.find_or_create_by_date_of_trade({opening: 200, closing: 300, high: 400, low: 50, volume: 100000, date_of_trade: "2012-03-26"})

sample_stock.trading_days.first.prediction = Prediction.find_or_create_by_trading_day_id({for_date: "2012-03-27", value: 400, trading_day_id: sample_stock.trading_days.first.id})
sample_stock1.trading_days.first.prediction = Prediction.find_or_create_by_trading_day_id({for_date: "2012-03-27", value: 400, trading_day_id: sample_stock1.trading_days.first.id})