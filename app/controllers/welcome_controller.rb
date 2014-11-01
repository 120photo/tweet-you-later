class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to tweets_path # redirect user to /tweet from / if user is logged in
    end

    @jumbo_h1 = "Tweet You Later"
    @jumbo_p = "Tweeting when you want."
  end

  def about
  end
end
