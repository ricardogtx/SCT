class UsersController < ApplicationController
  before_action :user_need_to_be_logged, only: [:show, :profile, :edit, :update, :admin, :clinic_edit]
  before_action :user_need_associated_a_clinic_or_admin, only: [:index, :profile, :edit, :update, :admin, :clinic_edit]

  attr_accessor :password

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
    if @user.password == @user.password_confirmation
    	if @user.save
        session[:user_id] = @user.id
        redirect_to :users, notice: 'Usuario cadastrado com sucesso'
    	else
    		render :new
    	end
    else
      flash.now[:error] = "Senhas diferentes"
      render :new
    end
  end

  def destroy
  end

  def index
    @user = current_user
    if request.post? && !params[:do_login][:email].blank? && !params[:do_login][:password].blank?
      user = User.find_by_email(params[:do_login][:email])

      if user.nil?
        flash.now[:error] = "Usuário não encontrado ou Email invalido"
      elsif user.authenticate(params[:do_login][:password])
        session[:user_id] = user.id
        authenticate
      else
        flash.now[:error] = "Senha invalida"
      end
    elsif request.post?
      flash.now[:error] = "Insira um Email e Senha"
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

  def profile
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update_attributes(user_params)
      redirect_to :users_profile
    else
      render :users_profile_edit
    end
  end

  def admin
  end

  def clinic_edit
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def authenticate
    if is_user_logged?
      user = current_user

      if user.authenticate_admin_user(user)
        redirect_to :admin, :notice => "Logado!"
      elsif user.authenticate_clinic_user(user)
        redirect_to :users, :notice => "Logado!"
      else
        redirect_to :logout, notice: 'Voce precisa esta associado a uma clínica!'
      end
    end
  end

  def user_need_associated_a_clinic_or_admin
    user = current_user

    if user
      unless user.authenticate_clinic_user(user) or user.authenticate_admin_user(user)
        redirect_to :logout, notice: 'Voce precisa esta associado a uma clínica!'
      end
    end
  end

  def user_need_to_be_logged
    if session[:user_id].nil?
      redirect_to :users, notice: 'Voce precisa fazer login!'
    end
  end
end