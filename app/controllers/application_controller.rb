class ApplicationController < ActionController::Base
  include SessionsHelper

  def require_login
    if !logged_in?
      flash[:warning] = "You must be logged in to do this action"
      redirect_to root_url
    end
  end
  
end
