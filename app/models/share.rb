class Share < ActiveRecord::Base
  belongs_to :stock
  belongs_to :user
end
