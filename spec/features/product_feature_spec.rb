require 'spec_helper'

def create_product(someproduct)
		Product.create(:product_name => someproduct)
	end

describe 'products page' do

	before(:all) do
	  create_product 'Some product' 
	end
	  
	it 'should have some product' do 
		visit products_path	
		expect(page).to have_content 'Some product'	
	end 

end 

describe 'new page' do
	  
	it 'should create a product' do 
		visit new_product_path

		  within '.new_product' do
		  	fill_in 'Product name', with: 'New Candy'
		  	fill_in 'Description', with: 'A lot of sugar'
		  	fill_in 'Price', with: '8.00'
		  	click_button "Create Candy"
		  end	

	expect(current_url).to eq url_for(Product.last)
	expect(page).to have_content 'New Candy'
    expect(page).to have_content 'A lot of sugar'
    expect(page).to have_content '8.00'				
	end
end 