class Stock < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :stock_id
  validates_uniqueness_of :stock_id

  has_many :trading_days, :dependent => :destroy
  has_many :shares, :dependent => :destroy

  def self.fetch_all_quotes
    begin
      stocks = Stock.all
      stocks.each do |stock|
        fetch_quotes_for(stock, last_quotes_update(stock), Date.today)
      end
      return true
    rescue SymbolNotFoundException
      logger.error "SymbolNotFoundException Encoutered"
      return false
    end
  end

  def self.generate_predictions
    Stock.all.each do |stock|
      prediction_sum=0
      stock.trading_days.order("date_of_trade DESC").limit(30).each do |trading_day|
        prediction_sum += trading_day.closing
      end
      prediction_value = prediction_sum / 30
      stock.last_trading_day.create_prediction({value: prediction_value, for_date: stock.last_trading_day.date_of_trade+1.day})
    end
  end

  #def self.generate_predictions
  #    require 'rubygems'
  #    require 'ruby_fann/neural_network'
  #    Stock.all.each do |stock|
  #        prediction_sum=0
  #        training_input = Array.new
  #        training_output = Array.new
  #        trading_days = stock.trading_days.order("date_of_trade DESC").limit(31)
  #        trading_days.sort_by! {|x| x.date_of_trade}
  #        trading_days.each_with_index do |trading_day, index|
  #            training_output.push([trading_day.closing]) unless index == 0
  #            prediction_sum += trading_day.closing
  #            training_input.push([trading_day.opening, trading_day.closing, trading_day.high, trading_day.low, trading_day.volume]) unless index == 30
  #        end
  #        prediction_value = prediction_sum / 30
  #        fann = RubyFann::Shortcut.new(:num_inputs=>5, :num_outputs=>1)
  #        training_data = RubyFann::TrainData.new(:inputs=>training_input, :desired_outputs=>training_output)
  #        fann.train_on_data(training_data, 5, 1, 0.1)
  #        last_day = stock.last_trading_day
  #        output = fann.run([last_day.opening, last_day.closing, last_day.high, last_day.low, last_day.volume])
  #        stock.last_trading_day.create_prediction({value: (prediction_value + output.first), for_date: stock.last_trading_day.date_of_trade+1.day})
  #    end
  #end

  def last_trading_day
    trading_days.order("date_of_trade").last
  end

  private
  def self.fetch_quotes_for(stock, start_date, end_date)
    stock_symbol = stock.stock_id
    file_path = "app/assets/csv/"+Date.today.to_s+stock_symbol+".csv"
    unless File.exists? file_path
      generate_csv(stock_symbol, start_date, end_date, file_path)
      parse_csv(file_path, stock)
    end
  end

  def self.generate_csv(stock_symbol, start_date, end_date, file_path)
    file = File.new(file_path, 'w+')
    file.puts YahooFinance.quick_query(stock_symbol, start_date, end_date)
    file.close
  end

  def self.parse_csv(file_path, stock)
    require 'csv'
    CSV.open(file_path).each_with_index do |row, i|
      next if i==0
      trading_day_attributes = {date_of_trade: row[0].to_date, opening: row[1].to_f, high: row[2].to_f, low: row[3].to_f, closing: row[4].to_f, volume: row[5].to_i}
      stock.trading_days.find_or_create_by_date_of_trade(trading_day_attributes)
    end
  end

  def self.last_quotes_update(stock)
    if stock.trading_days.empty?
      quotes_update=Date.today-1.year
    else
      quotes_update=stock.last_trading_day.date_of_trade+1.day
    end
    quotes_update
  end

end