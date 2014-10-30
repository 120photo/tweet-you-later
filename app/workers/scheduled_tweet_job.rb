class ScheduledTweetJob
  include Sidekiq::Worker

  def perfrom(tweet_id)
    # user Twitter gem to select tweet
    # use user's tokens to post to twitter
  end
end
