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

  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" },path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  
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
  get 'order/listall' ,to: 'order#listall'
  get 'order/addfriend' ,to: 'order#addfriend'
  get 'order/addgroup' ,to: 'order#addgroup'
  get 'user/index'
  get 'user/friend'
  post 'user/addfriend'
  get 'user/notifications_list'
  root to: 'user#index'
  get 'item/index'
  get 'item/show'
  get 'item/new'
  post 'item/create'
  get 'item/edit'
  get 'item/update' 
  get 'item/destroy'
  get 'item/listInvited' ,to: 'item#listInvited'
  get 'item/listJoined' ,to: 'item#listJoined'
  get 'item/deleteInvited' ,to: 'item#deleteInvited'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
