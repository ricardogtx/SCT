class SessionsController < ApplicationController

	def new
	end

	def create 
		user = User.authenticate(params[:session][:email], params[:session][:password])

		if user.nil?
			flash.now[:error] = "Senha ou Email invalidos."
			render :new
		else
			sign_in user
			session[:user_id] = user.id
			redirect_to user, :notice => "Logged in!"
		end

	end

	def destroy
		sign_out
		session[:user_id] = nil
		redirect_to user, :notice => "Logged out!"
	end
end