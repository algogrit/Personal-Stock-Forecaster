# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#sample_stock = Stock.find_or_create_by_stock_id({stock_id: "12345", name: "sample"})
#sample_stock1 = Stock.find_or_create_by_stock_id({stock_id: "12346", name: "sample"})

#sample_stock.trading_days.find_or_create_by_date_of_trade({opening: 200, closing: 300, high: 400, low: 50, volume: 100000, date_of_trade: "2012-03-26"})
#sample_stock1.trading_days.find_or_create_by_date_of_trade({opening: 200, closing: 300, high: 400, low: 50, volume: 100000, date_of_trade: "2012-03-26"})

#sample_stock.trading_days.first.prediction = Prediction.find_or_create_by_trading_day_id({for_date: "2012-03-27", value: 400, trading_day_id: sample_stock.trading_days.first.id})
#sample_stock1.trading_days.first.prediction = Prediction.find_or_create_by_trading_day_id({for_date: "2012-03-27", value: 400, trading_day_id: sample_stock1.trading_days.first.id})

Stock.find_or_create_by_stock_id({stock_id: "TCS.NS", name: "Tata Consultancy Services"})
Stock.find_or_create_by_stock_id({stock_id: "TATASTEEL.NS", name: "Tata Steel"})
Stock.find_or_create_by_stock_id({stock_id: "SAIL.NS", name: "SAIL"})
Stock.find_or_create_by_stock_id({stock_id: "TVSMOTOR.BO", name: "TVS Motors"})
Stock.find_or_create_by_stock_id({stock_id: "MNM.BO", name: "Mahindra & Mahindra"})
Stock.find_or_create_by_stock_id({stock_id: "RELIANCE.NS", name: "Reliance Industries"})
Stock.find_or_create_by_stock_id({stock_id: "CAIRN.NS", name: "CAIRN"})
Stock.find_or_create_by_stock_id({stock_id: "INFY.BO", name: "Infosys"})
Stock.find_or_create_by_stock_id({stock_id: "SBI.BO", name: "State Bank of India"})
Stock.find_or_create_by_stock_id({stock_id: "AXISBANK.NS", name: "AXIS Bank"})
Stock.find_or_create_by_stock_id({stock_id: "ICICIBANK.NS", name: "ICICI Bank"})
Stock.find_or_create_by_stock_id({stock_id: "ACC.BO", name: "ACC Cements"})
Stock.find_or_create_by_stock_id({stock_id: "ITC.NS", name: "ITC"})
Stock.find_or_create_by_stock_id({stock_id: "HINDUNILV.NS", name: "Hindustan Unilever"})
Stock.find_or_create_by_stock_id({stock_id: "DLF.NS", name: "DLF"})
Stock.find_or_create_by_stock_id({stock_id: "LT.NS", name: "L & T"})
Stock.find_or_create_by_stock_id({stock_id: "BHEL.NS", name: "Bharat Heavy Electricals Limited"})
Stock.find_or_create_by_stock_id({stock_id: "COALINDIA.BO", name: "Coal India"})
Stock.find_or_create_by_stock_id({stock_id: "BHARTIART.NS", name: "Bharati Airtel"})
Stock.find_or_create_by_stock_id({stock_id: "RCOM.BO", name: "Reliance Communications"})
Stock.find_or_create_by_stock_id({stock_id: "SIEMENS.BO", name: "Siemens"})
Stock.find_or_create_by_stock_id({stock_id: "RANBAXY.NS", name: "Ranbaxy Pharmaceuticals"})
Stock.find_or_create_by_stock_id({stock_id: "DRREDDY.NS", name: "Dr. Reddy's"})
Stock.find_or_create_by_stock_id({stock_id: "BPCL.NS", name: "BPCL"})
Stock.find_or_create_by_stock_id({stock_id: "NTPC.NS", name: "NTPC"})