Rails.application.routes.draw do
  get 'tasks/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root "users#index"
  resources :users, only: [:index, :show]
  resources :tasks
end
