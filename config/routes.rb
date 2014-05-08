Hackerlabs::Application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  get 'check-in', to: 'users#check_in', as: 'check_in'
  resources :users
end
