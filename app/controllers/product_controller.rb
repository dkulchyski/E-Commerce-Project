class ProductController < ApplicationController
  
  def index
    @products_in_stock = Product.where("stock_quantity > 0").order("name").page(params[:page]).per(5)
    if session[:visit_count]
      @visit_count = session[:visit_count] + 1
    else
      @visit_count = 1
    end
    session[:visit_count] = @visit_count
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def add_to_cart
    if session[:cart]
      @products_in_cart = session[:cart]
    end
    
    @products_in_cart << params[:id]
    
    session[:cart] = @products_in_cart
    
    redirect_to :back
  end
  
  def search
    #search stuff here.
    
    unless params[:product][:category].to_i == 8
      Category.where("id == ?",params[:product][:category]).each do |category|
        @products = category.products
      end
      @products = check_name_and_descr(@products,params[:main_search])
      
    else
      wildcard_keywords = '%' + params[:main_search] + '%'
      @products = Product.where("name LIKE ? AND description LIKE ?",wildcard_keywords,wildcard_keywords).order("name")
      #@products += Product.where("description LIKE ?",wildcard_keywords).order("name").page(params[:page]).per(5)
    end
  end
  
  private
  def check_name_and_descr(products,words)
    nproducts = []
    
    products.each do |product|
      unless product.name.downcase.index(words.downcase) == nil
        if product.name.downcase.index(words.downcase) > -1
          nproducts << product
        end
      end
      
    end
    
    return nproducts
  end
  
end
