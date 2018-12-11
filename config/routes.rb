Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'books#index'

  resources :books, only:[:index, :show, :new, :create, :destroy] do
    resources :reviews, only:[:new, :create]
  end


  resources :authors, only:[:show, :destroy]

  resources :users, only:[:show]

  resources :reviews, only:[:destroy]
end
