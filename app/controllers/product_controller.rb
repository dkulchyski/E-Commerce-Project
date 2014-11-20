class ProductController < ApplicationController
   before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products_in_stock = Product.where("stock_quantity > 0")
  end
  
  def show
  end
  
  
  private
    def set_product
      @product = Product.find(params[:id])
    end
end
