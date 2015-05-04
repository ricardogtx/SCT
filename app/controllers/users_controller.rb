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
      
      if user.nil?
        flash.now[:error] = "Insira um email e senha."
        render :login
      elsif user.authenticate(params[:do_login][:password])
        session[:user_id] = user.id
        redirect_to :users, :notice => "Logado!"
      else
        flash.now[:error] = "Senha ou Email invalidos."
        render :login
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

  def profile
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
  end

  def edit
    @user = current_user
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
  end

  private
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end