class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to tweets_path # redirect user to /tweet from / if user is logged in
    end
  end

  def about
  end
end
