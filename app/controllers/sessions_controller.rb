class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "You have successfully logged in"
      redirect_to user
    else
      flash[:warning] = "Failed to Log In, check username or password"
      redirect_to login_path
    end
  end

  def destroy
    log_out if logged_in?
    flash[:warning] = "You have logged out"
    redirect_to root_url
  end



end
