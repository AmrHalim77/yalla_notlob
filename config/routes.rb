Rails.application.routes.draw do
  resources :friendships
  post '/friendships/create', to: 'friendships#create'
  post '/friendships/destroy', to: 'friendships#destroy'
  post '/groups/update', to: 'groups#update'
  resources :groups 
  post 'groups/addmember' , to: 'groups#addmember'
  get 'groups/:id/deletemember' , to: 'groups#deletemember'
  # get 'groups/index'
  # get 'groups/show'
  # get 'groups/new'
  # get 'groups/edit'
  # get 'groups/destroy'

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  notify_to :users, with_devise: :users
  get 'user/notifications_list'
  get 'order/display_notification'
  get 'order/index'
  get 'order/toitem'
  get 'order/show'
  get 'order/new'
  post 'order/create'
  get 'order/edit'
  get 'order/toitem'
  post 'order/update' 
  get 'order/destroy'
  get 'user/index'
  get 'user/friend'
  post 'user/addfriend'
  root to: 'user#index'
  get 'item/index'
  get 'item/show'
  get 'item/new'
  post 'item/create'
  get 'item/edit'
  get 'item/update' 
  get 'item/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
