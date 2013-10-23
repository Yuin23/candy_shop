class Product < ActiveRecord::Base
	has_and_belongs_to_many :carts
	has_attached_file :image, styles: {thumb: '200x200>'},
						storage: :s3,
						bucket: 'candy_shop'
end
