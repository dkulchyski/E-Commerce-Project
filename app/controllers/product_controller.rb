class ProductController < ApplicationController
  
  def index
    @products_in_stock = Product.where("stock_quantity > 0")
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def search
    #search stuff here.
    wildcard_keywords = '%' + params[:main_search] + '%'
    @products = Product.where("name LIKE ?",wildcard_keywords)
  end
  #View app/view/product/search.html.erb
  
end
