class ScheduledTweetJob
  include Sidekiq::Worker

  def perform(tweet_id)
    # user Twitter gem to select tweet
    # use user's tokens to post to twitter
    tweet = Tweet.find(tweet_id)

    # configuration for Twitter gem
    config = {
      :consumer_key => ENV["TWITTER_KEY"],
      :consumer_secret => ENV["TWITTER_SECRET"],
      :access_token => tweet.user.oauth_token,
      :access_token_secret => tweet.user.oauth_secret
    }

    # setup new client for Twitter Gem and passing config
    tweet_client = Twitter::REST::Client.new(config)

    # use twitter client to post scheduled tweet body
    tweet_client.update(tweet.body)

  end
end
