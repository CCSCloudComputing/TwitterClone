class TweetsController < ApplicationController
  def create
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
