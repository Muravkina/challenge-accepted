Rails.application.routes.draw do

  root 'sessions#new'

  get    '/login' => 'sessions#new'
  post   '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users do
    resources :challenges
  end

  resources :challenges do
    resources :accomplished_challenges
  end

  resources :accomplished_challenges, only: [:show]
end
