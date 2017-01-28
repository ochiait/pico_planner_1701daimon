Rails.application.routes.draw do
  root 'top#index' 
  get 'lessons/form' => 'lessons#form'
  get 'lessons/register' => 'lessons#register'
  get 'lessons/hello' => 'lessons#hello'
  resources :plan_items
  resources :users
  resource :session, only: [:create, :destroy]
end
