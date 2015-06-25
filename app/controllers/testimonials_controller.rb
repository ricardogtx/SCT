class TestimonialsController < ApplicationController
	before_action :need_be_admin, only: [:edit, :update, :destroy]

	def new
		@testimonial = Testimonial.new
	end

	def create
		@testimonial = Testimonial.new(testimonial_params)
		if @testimonial.save
			redirect_to depoimentos_path, notice: "Enviado com sucesso."
		end
	end

	def show
		@testimonial = Testimonial.all
	end

	def edit
		@testimonial = Testimonial.find(params[:id])

		if @testimonial.testimonial_authenticate
			redirect_to :admin, notice: "Esse depoimento já foi aprovado"
		end
	end

	def update
		@testimonial = Testimonial.find(params[:id])

		if @testimonial.testimonial_authenticate
          redirect_to :admin, notice: "Esse depoimento já foi aprovado"
        elsif @testimonial.update(testimonial_params)
			redirect_to :admin, notice: "Atualizado com sucesso."
		end
	end

	def destroy
  	  @testimonial = Testimonial.find(params[:id]).destroy
  	  redirect_to admin_path, notice: "Depoimento excluido."
 	end

	private
	def testimonial_params
		 params.require(:testimonial).permit(:title, :body)
	end

	def need_be_admin
    user = current_user

    unless user and user.level_user
      redirect_to :logout, notice: 'Área não permitida!'
    end
  end
end