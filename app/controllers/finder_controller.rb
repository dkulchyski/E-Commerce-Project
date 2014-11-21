class FinderController < ApplicationController
  
  def index
    @products = Product.all
    @newestProducts = @products.last(4)
    @greatProducts = Product.where('stock_quantity > 0').limit(4)
  end
  
end
