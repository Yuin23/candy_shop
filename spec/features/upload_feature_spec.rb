require 'spec_helper'

describe 'when I create a product' do 
	it 'can have an uploaded picture' do 
		visit new_product_path

		attach_file 'Image', test_image_path
		click_button 'Create Candy'

		expect(page).to have_css 'img.product_image'
	end 

end 