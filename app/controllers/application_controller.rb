class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def welcome
    render :text => "Hello World", :layout => "application"
  end
end
