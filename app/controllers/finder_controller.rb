class FinderController < ApplicationController
  
  def index
    @products = Product.all
    @newestProducts = @products.last(4)
  end
  
end
