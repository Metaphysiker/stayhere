Rails.application.routes.draw do
  resources :signatures
  devise_for :users
  root 'static_pages#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'open_letter', to: 'static_pages#open_letter', as: 'open_letter'
  get 'biel', to: 'static_pages#biel', as: 'biel'
  get 'preles', to: 'static_pages#preles', as: 'preles'
  get 'asyl', to: 'static_pages#asyl', as: 'asyl'
  get 'donate', to: 'static_pages#donate', as: 'donate'
  get 'archive', to: 'static_pages#archive', as: 'archive'
  get 'contact', to: 'static_pages#contact', as: 'contact'
  get 'press_review', to: 'static_pages#press_review', as: 'press_review'
  get 'about', to: 'static_pages#about', as: 'about'
  get 'langbruck', to: 'static_pages#langbruck', as: 'langbruck'
  get 'children_right', to: 'static_pages#children_right', as: 'children_right'

  post '/signatures/add_signature', to: "signatures#add_signature", as: 'add_signature'

  get 'pin_board', to: 'signatures#pin_board', as: 'pin_board'
end
