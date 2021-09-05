Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :posts do 
        resources :likes, :only => [:index, :create, :destroy]
      end
      get 'api/v1/posts/:post_id/likes/:user_id' , to: 'api/v1/likes#index' 
    end
  end

  devise_for :users
  resources :users

  namespace 'api' do
    namespace 'v1' do
      resources :sessions
      resources :users
    end
      get "search", to: 'api/v1/posts#search'
  end

end
