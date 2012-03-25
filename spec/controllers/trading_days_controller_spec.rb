require 'spec_helper'

describe TradingDaysController do

  def valid_attributes
    {
        date_of_trade: Date.today,
        opening: "100",
        closing: "200",
        high: "400",
        low: "50",
        volume: "100000"
    }
  end

  def valid_session
    {}
  end

  describe "GET 'show'" do
    it "returns http success" do
      trading_day = TradingDay.create! valid_attributes
      get 'show', {:id => trading_day.to_param}, valid_session
      response.should be_success
    end
  end
end