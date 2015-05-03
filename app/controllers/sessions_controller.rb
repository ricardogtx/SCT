class SessionsController < ApplicationController

	def new
	end

	def create 
		user = User.find_by_email(params[:email])

		if user.nil? || user.authenticate(params[:password]).nil?
			flash.now[:error] = "Senha ou Email invalidos."
			render :new
		else
			#sign_in user
			session[:user_id] = user.id
			redirect_to url_for(:controller => :users, :index => :index), :notice => "Logado!"	
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to :users, :notice => "Deslogado!"
	end

	private
  def session_params
   params.require(:session).permit(:email, :password)
  end
end
