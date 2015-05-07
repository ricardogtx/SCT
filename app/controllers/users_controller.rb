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
    return authenticate if is_user_logged?
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
    user_was_logged = is_user_logged?
    session[:user_id] = nil
    
    if request.xhr?
      render :json => {user_was_logged: user_was_logged}
    else
      redirect_to :users, :notice => "Deslogado!"
    end
  end

  def show
    @user = current_user
  end

  def profile
    @user = current_user
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
    redirect_to :users_clinic_profile unless @user.clinic.nil?
  end

  def clinic_profile
    @user = current_user
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
    redirect_to :users_profile unless !@user.clinic.nil?
  end

  def edit
    @user = current_user

    redirect_to :users, notice: 'Voce precisa fazer login!' unless is_user_logged?
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

  def clinic
    @user = current_user
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
  end

  def clinic_edit
    redirect_to :users, notice: 'Voce precisa fazer login!' unless is_user_logged?
    @user = current_user
    redirect_to :users_profile_edit if @user.clinic.nil?
  end

  def authenticate
    user = current_user
    if user.authenticate_admin_user(user)
      redirect_to :admin
    elsif user.authenticate_clinic_user(user)
      redirect_to :users_clinic
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end