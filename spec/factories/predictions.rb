# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prediction do
    value 1
    for_date "2012-03-25"
    trading_day nil
  end
end
