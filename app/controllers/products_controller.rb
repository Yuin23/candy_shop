class ProductsController < ApplicationController
	def index
		@products = Product.all	
    end

    def new
		@product = Product.new
    end

    def create
    	@product = Product.create(params[:product].permit(:product_name, :description, :image))    
    	redirect_to @product		

    rescue AWS::S3::Errors::RequestTimeout
        flash.now[:notice] = "Upload time out"
        render 'new'
    end


    def show
    	@product = Product.find(params[:id])   		
    end
end


