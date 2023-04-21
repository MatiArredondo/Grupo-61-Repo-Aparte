Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                   path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  root "articles#index"

  get "/articles", to: "articles#index"
  resources :products
  resources :chats
  resources :orders
end
