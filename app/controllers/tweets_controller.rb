class TweetsController < ApplicationController
  def new
  end
  
  def create
    tweet = Tweet.new(:content => params[:content], :user_id => current_user.id)
    tweet.save
    redirect_to current_user.home_page
  end
  
  def show
    begin
      @user  = User.find_by_username(params[:user])
      @tweet = Tweet.find_by_tweet_id(params[:id])
      render :action => 'show'
    rescue ActiveRecord::RecordNotFound
      render :text => "No such thing."
    end
  end
  
  def update
  end
  
  def delete
  end
end
