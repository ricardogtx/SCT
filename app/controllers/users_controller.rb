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

  def index
    authenticate if is_user_logged?
  end

  def login
    authenticate if is_user_logged?

    if !params[:do_login].nil? && request.post?
      user = User.find_by_email(params[:do_login][:email])
      
      if user.nil?
        flash.now[:error] = "Insira um email e senha."
        render :login
      elsif user.authenticate(params[:do_login][:password])
        session[:user_id] = user.id
        if user.authenticate_admin_user(user)
          redirect_to :admin, :notice => "Logado!"
        elsif user.authenticate_clinic_user(user)
          redirect_to :users_clinic, :notice => "Logado!"
        else
          redirect_to :users, :notice => "Logado!"
        end
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
    @user = current_user
  end

  def profile
    @user = current_user
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
  end

  def edit
    redirect_to :users, notice: 'Voce precisa fazer login!' unless is_user_logged?

    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to :users_profile, notice: 'Dados atualizados com sucesso.'
    else
      render :users_profile_edit
    end
  end

  def admin
    
  end

  def users_clinic
  end

  def authenticate
    user = current_user
    if user.authenticate_admin_user(user)
      redirect_to :admin
    elsif user.authenticate_clinic_user(user)
      redirect_to :users_clinic
    #else
    #  redirect_to "/users"
    end
  end

  private
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end