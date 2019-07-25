Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "home/send_email" , to: "home#send_email"
  resources :images, only: [:index, :show, :create, :new] 
  resources :clients
end
