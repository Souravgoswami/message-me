Rails.application.routes.draw do
  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#new'

  get 'chatroom/index'
  get 'chatroom', to: 'chatroom#index'
  get 'chatroom/help'
  root to: 'chatroom#index'
end
