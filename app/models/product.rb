class Product < ActiveRecord::Base
  has_many :orders
  validates :name, :description, :price, :stock_quantity, presence: true
end
