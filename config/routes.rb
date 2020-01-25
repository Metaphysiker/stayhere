Rails.application.routes.draw do

  resources :signatures

  scope "(:locale)", locale: /de|fr/ do
    root 'static_pages#biel'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  localized do
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
    get 'pin_board', to: 'signatures#pin_board', as: 'pin_board'
  end

  post '/signatures/add_signature', to: "signatures#add_signature", as: 'add_signature'

  get "static_pages/download_pdf/:name", to: 'static_pages#download_pdf', as: 'download_pdf'
  get "static_pages/download_jpg/:name", to: 'static_pages#download_jpg', as: 'download_jpg'

    devise_for :users
end
