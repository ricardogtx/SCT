class SessionController < ApplicationController
	def new
	end

	def create 
		user = User.authenticate (params[:session][:email], params[:session][:password])

		if user.nil?
			flash.now[:error] = "Senha ou Email invalidos."
			render :new
		else
			sign_in user
			redirect_to user
		end

	end

	def destroy
		sign_out
		redirect_to signin_path
	end

end