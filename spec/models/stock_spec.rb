require "spec_helper"

describe "Stock" do
  it "should not be valid without a stock id" do
    stock = Stock.new(name: "Foo")
    stock.should_not be_valid
    end
  it "should not be valid without a name" do
    stock = Stock.new(stock_id: "BAR.SE")
    stock.should_not be_valid
  end
end