Rails.application.routes.draw do
  get 'user/index'
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  root to: 'user#index'
  get 'item/index'
  get 'item/show'
  get 'item/new'
  get 'item/create'
  get 'item/edit'
  get 'item/update'
  get 'item/destroy'
  get 'products/index'
  get 'products/show'
  get 'products/new'
  get 'products/create'
  get 'products/edit'
  get 'products/update'
  get 'products/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
