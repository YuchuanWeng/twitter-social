class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #set in instance variable, then it won't hit the databse everytime.
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You must logged in"
      redirect_to root_path
    end
  end

  def wrong_path
     flash[:error] = "There was an error."
     redirect_to root_path
  end
end
