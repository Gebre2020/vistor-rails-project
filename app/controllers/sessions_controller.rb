class SessionsController < ApplicationController

  # def home
  # end
  
  def destroy
    if !session[:user_id].nil?
      flash[:message] = "Are you sure?" 
      session.delete(:user_id)
      @current_user = nil
    else
       redirect_to "/login"
    end        
  end

  def new
    if logged_in?
      redirect_to root_path
    end 
  end
  
  def create
    user = User.find_by(username: params[:user][:username])
    # if !user
    #   redirect_to '/signup'
    if user && user.authenticate(params[:user][:password])
      # logging in
      session[:user_id] = user.id
      redirect_to root_path
      # redirect_to "/users/#{user.id}"
    else
      flash[:message] = "Invalid email/password combination"
      redirect_to "/login"
    end
  end

   
  def omniauth 

  #   user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
  #     u.username = request.env['omniauth.auth'][:info][:first_name]
  #     u.email = request.env['omniauth.auth'][:info][:email]
  #     u.password = SecureRandom.hex(15)
  #   end 
  #   if user.valid?
  #     session[:user_id] = user.id # log them 
  #     redirect_to root_path
  #   else
  #     redirect_to login_path 
  #   end 
  # end 

    user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider])
    user.username = request.env['omniauth.auth'][:info][:first_name]
    user.email = request.env['omniauth.auth'][:info][:email]    # 
    user.password = SecureRandom.hex(15)
    if user.save
      session[:user_id] = user.id # log them 
      redirect_to root_path
    else
      redirect_to login_path 
    end 
  end
  
  private
  def auth
    request.env['omniauth.auth']
  end

end