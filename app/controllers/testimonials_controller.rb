class TestimonialsController < ApplicationController
	def new
		@testimonial = Testimonial.new
	end

	def create
		@testimonial = Testimonial.new(testimonial_params)
		@testimonial.save
		redirect_to depoimentos_path
	end

	def show
	end
	
	def edit
	end

	def destroy
	end

	private
	def testimonial_params
		 params.require(:testimonial).permit(:title, :body)
	end
end