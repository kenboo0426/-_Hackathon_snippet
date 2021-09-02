Rails.application.routes.draw do
  scope :api, format: 'json' do
    scope :v1 do
      resources :posts
    end
  end
  devise_for :users
  resources :users

  namespace 'api' do
    namespace 'v1' do
      resources :users
    end
  end

end
