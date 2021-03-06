class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @prev_events = @user.previous_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      log_in (@user)
      redirect_to @user
    else
      flash.now[:warning] = "Unable to create user"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end


end
