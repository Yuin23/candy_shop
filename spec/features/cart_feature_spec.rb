require 'spec_helper'



describe 'the cart' do 
	let(:candy) {FactoryGirl.create(:product)}
	# how to create cart in factory girl, so the test can get cart.id
	# let(:candy) {FactoryGirl.create(:cart)}

	it 'should initially be empty' do 
		visit product_path(candy)
		expect(page).to have_css '.item_count', text: '0 items'
	end

	it 'should show a product after it was added' do 
		visit product_path(candy)
		click_button "Add to Cart"
		expect(page).to have_css '.item_count', text: '1 item'
	end  

	it 'should show the list of product name of each item and the total amount' do 
		visit product_path(candy)
		click_button "Add to Cart"
		visit cart_path(current_cart)
		expect(page).to have_content 'candy'
		expect(page).to have_content 'Total Amount: 8.00'
	end 

end 