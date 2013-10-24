require 'spec_helper'

def emails
	ActionMailer::Base.deliveries
end


describe 'order confirmation' do

	it 'should be send after order' do
		# e.g. internal rails methods, deliver method is called. -> complicated.
		expect { Order.create(number_of_items: 3) }.to change { emails.count }.by 1
	end

	# Meaning:
	# old_email_count = emails.count
	# Order.create(nuber_of_items: 3)
	# expect(emails.count).to eq (old_email_count + 1 }
	# end

	it 'should have the subject "Order confirmation"' do
		Order.create(number_of_items: 3)
		expect(emails.last.subject).to eq "Order Confirmation"
	end


	it 'should name the number of items' do
		Order.create(number_of_items: 3)
		expect(emails.last.body).to match "3 items"
	end

end