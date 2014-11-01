class TweetsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @tweets = Tweet.all.where(user_id: current_user.id)
    @jumbo_h1 = "Tweet Center"
    @jumbo_p = "Controll your future tweets."
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

  def destroy
    @tweet = Tweet.find(params[:id])
    # @tweet = Tweet.all
    # @tweet.destroy

    if @tweet.destroy
      flash[:notice] = "Tweet was cancelled."
      redirect_to '/tweets'
    else
      flash[:error] = "Could not delete, hope the tweet is not that bad..."
      render :show
    end

  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :scheduled_time)
  end

end
