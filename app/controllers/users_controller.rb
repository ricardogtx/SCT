class UsersController < ApplicationController

  attr_accessor :password

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      session[:user_id] = user.id
      redirect_to :users, notice: 'Usuario cadastrado com sucesso'
  	else
  		render :new
  	end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :user
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end