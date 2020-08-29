Rails.application.routes.draw do
  # mount ActionCable.server, at: '/cable'

  post 'message', to: 'messages#create'

  delete 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#new'

  get 'chatroom/index'
  get 'chatroom', to: 'chatroom#index'
  get 'chatroom/help'
  root to: 'chatroom#index'
end
