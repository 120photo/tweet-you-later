Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'welcome#index'
  get '/about' => 'welcome#about'

  resources :tweets

  require 'sidekiq/web' # sidekiq monitoring app
  mount Sidekiq::Web => '/sidekiq' # sidekiq monitoring app

end
