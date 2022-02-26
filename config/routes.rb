Rails.application.routes.draw do
  get 'lists/new'
  # POST=新しいデータの作成
  # データを追加するためのルーティングを追記する
  post 'lists' => 'lists#create'
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  get 'homes/top'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
