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
		@testimonial = Testimonial.all
	end

	def edit
		@testimonial = Testimonial.find(params[:id])
	end

	def update
		@testimonial = Testimonial.find_by_id(params[:id])
		@testimonial.update(testimonial_params)
		redirect_to depoimentos_path
	end
	

	def destroy
	end

	private
	def testimonial_params
		 params.require(:testimonial).permit(:title, :body)
	end
end