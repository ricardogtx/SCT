class HomeController < ApplicationController
  def index
  	@testimonial = Testimonial.last(3)
  end

  def about
  end
end
