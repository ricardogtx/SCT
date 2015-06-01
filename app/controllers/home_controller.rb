class HomeController < ApplicationController
  def index
  	@testimonial = Testimonial.last(2)
  end
end
