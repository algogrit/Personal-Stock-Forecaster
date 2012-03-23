require 'spec_helper'

describe "stocks/new" do
  before(:each) do
    assign(:stock, stub_model(Stock,
      :stock_id => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new stock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stocks_path, :method => "post" do
      assert_select "input#stock_stock_id", :name => "stock[stock_id]"
      assert_select "input#stock_name", :name => "stock[name]"
    end
  end
end
