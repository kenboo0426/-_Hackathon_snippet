Rails.application.routes.draw do
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :posts
    end
  end
  devise_for :users
  resources :users

  namespace 'api' do
    namespace 'v1' do
      resources :sessions
      resources :users
      resources :comments
      get "search", to: 'api/v1/posts#search'
    end
  end

end
