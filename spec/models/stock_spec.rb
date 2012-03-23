require 'spec_helper'

describe Stock do
  it "should be valid with a name and a stock id" do
    stock = FactoryGirl.build(:stock)
    stock.should be_valid
  end

  it "should not be valid without a name" do
    stock = FactoryGirl.build(:stock_with_no_name)
    stock.should_not be_valid
    end

  it "should not be valid without a stock id" do
    stock = FactoryGirl.build(:stock_with_no_stock_id)
    stock.should_not be_valid
  end
end