class UsersController < ApplicationController

  attr_accessor :password

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = @user.id
      redirect_to :users, notice: 'Usuario cadastrado com sucesso'
  	else
  		render :new
  	end
  end

  def destroy
  end

  def login
    redirect_to :users unless session[:user_id].nil?

    if !params[:do_login].nil? && request.post?
      user = User.find_by_email(params[:do_login][:email])
      if user.nil? || user.authenticate(params[:do_login][:password]).nil?
        flash.now[:error] = "Senha ou Email invalidos."
        render :login
      else
        #sign_in user
        session[:user_id] = user.id
        redirect_to :users, :notice => "Logado!"  
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :users, :notice => "Deslogado!"
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end