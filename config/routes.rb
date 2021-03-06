Rails.application.routes.draw do
  root 'homes#top'
  #get 'top' => 'books#index'
  get '/home/about', to: 'homes#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:new, :index, :show, :update, :edit]
end
