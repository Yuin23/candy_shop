require 'spec_helper'



describe 'the cart' do 
	let(:candy) {FactoryGirl.create(:product)}

	it 'should initially be empty' do 
		visit product_path(candy)
		expect(page).to have_css '.item_count', text: '0 items'
	end 
end 