Rails.application.routes.draw do
  root 'top#index'
  get 'lessons/form' => 'lessons#form'
  get 'lessons/register' => 'lessons#register'
  get 'lessons/hello' => 'lessons#hello'

  resources :members do
    resources :entries, only: [:index]
  end
  resources :plan_items
  resources :users
  resource :login
  resources :entries
end
