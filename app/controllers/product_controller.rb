class ProductController < ApplicationController
  
  def index
    @products_in_stock = Product.where("stock_quantity > 0").order("name").page(params[:page]).per(5)
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def search
    #search stuff here.
    wildcard_keywords = '%' + params[:main_search] + '%'
    @products = Product.where("name LIKE ?",wildcard_keywords)
    @products += Product.where("description LIKE ?",wildcard_keywords)
    @categories = Category.where("name LIKE ?",wildcard_keywords)
    
    @categories.each do |category|
      @products += category.products
    end
    @products = @products.uniq
  end
  
end
