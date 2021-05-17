class UsersController < ApplicationController
  
  def new  # render a signup form
    if !logged_in?
      @user = User.new
    else
      redirect_to root_path
    end
  end

  def create  # processing sign up form
    user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        # flash[:success] = "Welcome to the Travel App!"
        redirect_to @user
    else
        render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end

  private

  def user_params  # strong params
    params.require(:user).permit(:username, :email, :password)
  end
end
