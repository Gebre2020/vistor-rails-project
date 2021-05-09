class ApplicationController < ActionController::Base
    # include AplicationHelper

  
    # gives access to methods in the views
    # before_action :authorized
    helper_method :current_user
    helper_method :logged_in?

    private

    def current_user
    #   if session[:user_id]
    #     @current_user = User.find_by(id: session[:user_id])
    #   end
       @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
     
    def logged_in?
      !!session[:user_id]
    end
  
    def redirect_if_not_logged_in
      redirect_to '/' if !logged_in?
     # redirect_to sign_in_path, alert: "You must be signed in to do that." if current_user.nil?
    end
  
end
