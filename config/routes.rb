Rails.application.routes.draw do

  root 'sessions#new'

  post '/login' => 'sessions#create'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => '/'
  get '/signout' => 'sessions#destroy'

  get '/users/:user_id/challenges/in_progress' => 'challenges#in_progress'
  get '/users/:user_id/challenges/created' => 'challenges#created'
  get '/users/:user_id/challenges/accomplished' => 'challenges#accomplished'

  resources :comments, only: [:create]
  resources :users do
    resources :challenges
  end

  resources :challenges do
    resources :accepted_challenges, only: [:index]
  end

  resources :accepted_challenges
end
