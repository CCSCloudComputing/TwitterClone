class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper :all
  helper_method :logged_in?, :current_user
  
  def logged_in?
    if session[:user_id]
      User.find(session[:user_id]) ? true : false
    else 
      false
    end
  end
  
  def current_user
    User.find(session[:user_id])
  end
  
  def welcome
    @user = current_user
  end
  
  def login
    unless logged_in? or request.get?
      begin
        @user = User.authenticate(params[:username], params[:password])
        session[:user_id] = @user.id
      rescue ApplicationHelper::AuthError => e
        flash[:error] = e.message
      end
      redirect_to "/"
    end
  end
  
  def logout
    if logged_in?
      session[:user_id] = Nil
    end
    redirect_to "/"
  end
end
