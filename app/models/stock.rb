class Stock < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :stock_id
  validates_uniqueness_of :stock_id

  has_many :trading_days, :dependent => :destroy

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
    if stock.trading_days.first.nil?
      quotes_update=Date.today-1.year
    else
      quotes_update=stock.trading_days.find(:first, :order => "created_at DESC").created_at.to_date
    end
    quotes_update
  end

end