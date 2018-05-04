Rails.application.routes.draw do
  devise_for :users
  resources :games

  get '/welcome', to: 'welcome#index'

  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
