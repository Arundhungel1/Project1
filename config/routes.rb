Rails.application.routes.draw do
  devise_for :users
  resources :workouts do
    resources :exercises
  end
  root to: 'home#index'
end
