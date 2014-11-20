class Order < ActiveRecord::Base
  has_many :lineitems
end
