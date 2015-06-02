require 'rails_helper'

RSpec.describe TestimonialsController, type: :controller do 

	before :all do
		Testimonial.destroy_all
		@testimonial = Testimonial.new
	end

	describe 'GET #new' do
	
		it "should have a body" do
			@testimonial.title = "RSpec"
			@testimonial.body = ""
			expect(@testimonial).not_to be_valid
		end

		it "should have a title" do
			@testimonial.title = ""
			@testimonial.body = "RSpec"
			expect(@testimonial).not_to be_valid
		end

		it "should create a new testimonial" do
				@testimonial.title = "RSpec"
				@testimonial.body = "RSpec"
				expect(@testimonial).to be_a(Testimonial)
		end

		it "should be invalid if title has more than 2000 caracteres" do
				@testimonial.title = "RSpec"
				@testimonial.body = "R"*2001
				expect(@testimonial).not_to be_valid
		end
	end

	describe 'POST #create' do
		
		it "should redirect to show with a notice on successfull save" do
			expect{
				post :create, :testimonial => {:title => 'RSpec', :body => 'RSpec'}
			}.to change(Testimonial, :count).by(1)
			expect(flash[:notice]).not_to be_blank
			expect(response).to redirect_to(depoimentos_path)
		end
	end

	describe 'PATCH #edit/update' do
		
		it "should update title" do
			@testimonial = Testimonial.create(title:"RSpec", body:"Rspec")
			expect {
				patch :update, id:@testimonial, testimonial: {:title => "Test"}
				@testimonial.reload
			}.to change(@testimonial, :title).to("Test")
		end

		it "should update body" do
			@testimonial = Testimonial.create(title:"RSpec", body:"Rspec")
			expect {
				patch :update, id:@testimonial, testimonial: {:body => "Test"}
				@testimonial.reload
			}.to change(@testimonial, :body).to("Test")
		end
	end
end