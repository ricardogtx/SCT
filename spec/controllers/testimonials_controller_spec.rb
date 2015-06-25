require 'rails_helper'

RSpec.describe TestimonialsController, type: :controller do 
  before :all do
	  
	  User.destroy_all
	  User.create! :id=>1, :name=>"vitor", :email=>"vitor.nere@hotmail.com", :password=>"123456", :password_confirmation=>"123456", :user_authenticate=>1
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)
	  Testimonial.create(title: "test drugs", body: "test drugs", testimonial_authenticate: 1)	
    @testimonial = Testimonial.new
	end
	
end