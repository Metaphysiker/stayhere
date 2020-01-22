Rails.application.routes.draw do
  resources :signatures
  devise_for :users
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'open_letter', to: 'static_pages#open_letter', as: 'open_letter'
  post '/signatures/add_signature', to: "signatures#add_signature", as: 'add_signature'

  get 'pin_board', to: 'signatures#pin_board', as: 'pin_board'
end
