Rails.application.routes.draw do
  get '/top' => "homes#top"
  resources :lists #lists コントローラの同じ名前のアクションに紐づく形で、ルーティングを自動生成
  # get 'lists/new'
  # post 'lists' => 'lists#create' #listsのURLで、postメソッドであるlistsコントローラーのcreateアクションを呼ぶ
  # get 'lists' => 'lists#index'
  # get 'lists/:id' => 'lists#show',as:'list'  #'lists#show'の設定を、listとして利用できる
  # get 'lists/:id/edit' => 'lists#edit', as:'edit_list'
  # patch 'lists/:id' => 'lists#update', as:'update_list'
  # delete 'lists/:id' => 'lists#destroy', as:'destroy_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
