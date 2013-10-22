class CartsController < ApplicationController
def update
	product = Product.find params[:cart][:id][:product_id]
	current_cart.products << product 
	redirect_to product_path(product)
end
end