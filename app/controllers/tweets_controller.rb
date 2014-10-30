class TweetsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tweets = Tweet.all.where(user_id: current_user.id)
  end

  def show
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    @tweet.save
    redirect_to tweets_url
  end

  def edit
  end

  def update
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :scheduled_time)
  end

  def my_tweets
    if current_user
      @tweets = Tweet.all.where(user_id: current_user.id)
      return @tweets
    end
  end

end
