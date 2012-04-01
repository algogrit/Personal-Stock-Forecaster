# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    stock nil
    date_of_purchase "2012-04-01"
    date_of_sale "2012-04-01"
    volume 1
    user nil
  end
end
