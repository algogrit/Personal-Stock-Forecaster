class Stock < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :stock_id

  has_many :trading_days, :dependent => :destroy
end