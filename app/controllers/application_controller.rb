class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def current_user_session
    return @current_user_session if defined? @current_user_session
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined? @current_user
    @current_user = current_user_session && current_user_session.record
  end
  
  def authorize
    unless current_user
      flash[:notice] = "Viewing this page requires you to log in."
      redirect_to login_path
    end
  end

end
