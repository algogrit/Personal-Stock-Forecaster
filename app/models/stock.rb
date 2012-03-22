class Stock < ActiveRecord::Base
  validates_presence_of :stock_id
  validates_presence_of :name

  has_many :TradingDay, dependent: :destroy
end
