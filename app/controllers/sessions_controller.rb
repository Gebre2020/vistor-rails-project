class SessionsController < ApplicationController

  # def home
  # end
  
  def destroy
    if !session[:user_id].nil?
      session.delete(:user_id)
      @current_user = nil
    else
       redirect_to '/'
    end        
  end

  # def new
  # end

  def create
    user = User.find_by(username: params[:user][:username])
    # if !user
    #   redirect_to '/signup'
    if user && user.authenticate(params[:user][:password])
        # logging in
        session[:user_id] = user.id
        redirect_to user_path(user)
        # redirect_to "/users/#{user.id}"
    else
        flash[:message] = "Invalid email/password combination"
        redirect_to "/login"
    end
  end

end