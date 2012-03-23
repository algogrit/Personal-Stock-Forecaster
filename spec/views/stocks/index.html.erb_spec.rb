require 'spec_helper'

describe "stocks/index" do
  before(:each) do
    assign(:stocks, [
      stub_model(Stock,
        :stock_id => "Stock",
        :name => "Name"
      ),
      stub_model(Stock,
        :stock_id => "Stock",
        :name => "Name"
      )
    ])
  end

  it "renders a list of stocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Stock".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
