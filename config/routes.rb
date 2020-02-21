Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "users#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :tasks
  resources :diaries
  # resources :tasks, only: :show, param: :day
end
