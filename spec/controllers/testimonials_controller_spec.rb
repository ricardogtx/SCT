require 'rails_helper'

RSpec.describe TestimonialsController, type: :controller do 

	before :all do
		@testimonial = Testimonial.new
	end

	describe 'GET #new' do
		it "must have a body" do
			@testimonial.title = "abc"
			@testimonial.body = ""
			expect(@testimonial).not_to be_valid
		end

		it "must have a title" do
			@testimonial.title = ""
			@testimonial.body = "abc"
			expect(@testimonial).not_to be_valid
		end

		it "create a new testimonial" do
				@testimonial.title = "cba"
				@testimonial.body = "abc"
			expect(@testimonial).to be_a(Testimonial)
		end
	end

	describe 'POST #create' do
		it "should redirect to show with a notice on successfull save" do
			expect{
				post :create, :testimonial => {:title => 'RSPEC', :body => 'RSpec'}
			}.to change(Testimonial, :count).by(1)
			expect(flash[:notice]).not_to be_blank
			expect(response).to redirect_to(depoimentos_path)
		end
	end
end