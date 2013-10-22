class ProductsController < ApplicationController
	def index
		@products = Product.all	
    end

    def new
		@product = Product.new
    end

    def create
    	@product = Product.create(params[:product].permit(:product_name, :description))    
    	redirect_to @product 		
    end

    def show
    	@product = Product.find(params[:id])   		
    end
end



