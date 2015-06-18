class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :default_page_title

  def current_user
    if session[:user_id]
      if session_actually_still_exists? # if yes, return id, if not, clear session and return nil
        User.find(session[:user_id])
      else
        session.clear
        return nil
      end
    end
  end

  helper_method :current_user

  def authorize
    redirect_to :login unless current_user
  end

  protected

    def is_user_logged?
      not session[:user_id].nil?
    end

    def default_page_title
      @page_title = "Sistemas de Comunidades Terapeuticas"
    end

  private
    def session_actually_still_exists?
      User.find_by_id(session[:user_id]) #Return nill if not
    end
end