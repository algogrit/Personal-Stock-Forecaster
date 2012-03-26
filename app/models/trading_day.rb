class TradingDay < ActiveRecord::Base
  belongs_to :stock
  has_one :prediction, :dependent => :destroy
end