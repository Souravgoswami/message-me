Rails.application.routes.draw do
  post 'login', to: 'session#create'
  get 'login', to: 'session#new'
  get 'chatroom/index'
  get 'chatroom', to: 'chatroom#index'
  get 'chatroom/help'
  root to: 'chatroom#index'
end
