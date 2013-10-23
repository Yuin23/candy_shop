# require 'spec_helper'


def test_image_path
	Rails.root.join('spec/images/Gummy.jpg')
end 


 def test_image
    test_image_path.open
 end 


