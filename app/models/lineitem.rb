class Lineitem < ActiveRecord::Base
  has_one :order
  has_one :product
end
