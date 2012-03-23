FactoryGirl.define do
  factory :stock do
    name 'Foo'
    stock_id  '12345'
  end

  factory :stock_with_no_name, :parent => :stock do
    name nil
  end

  factory :stock_with_no_stock_id, :parent => :stock do
    stock_id nil
  end
end