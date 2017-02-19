Rails.application.routes.draw do
  # 設定首頁
  root 'orders#index'

  resources :orders

  # /login 是連結到使用者登入的表單，登出是 /logout
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end
