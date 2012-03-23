FactoryGirl.define do
  factory :trading_day do
    opening 1
    closing 1
    high 1
    low 1
    volume 1
    date_of_trade "2012-03-23"
    stock nil
  end
end
