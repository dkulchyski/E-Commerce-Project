class FinderController < ApplicationController
  
  def index
    @products = Product.all
  end
  
end
