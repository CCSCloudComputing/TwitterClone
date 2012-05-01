class UsersController < ApplicationController
  def page
    @user = User.find_by_username(params[:username])
    if @user
      @tweets = @user.tweets
    else 
      flash[:error] = "Not a valid page."
      redirect_to "/"
    end
  end
  
  # Clean RESTful interface to the resources 
  def new
  end
  
  def edit
  end
  
  def create
    password = params[:password]
    password_conf = params[:password_conf]
    unless password == password_conf # raise "Auth Issue" unless password == password_conf
      flash[:auth_error] = "Password and Password Confirmation don't match."
    else
      user = User.new(:name => params[:name], :username => params[:username], :password => password)
      user.save
    end
    redirect_to "/users/new"
  end
  
  def read
    
  end
  
  def update
  end
  
  def delete
  end
end
