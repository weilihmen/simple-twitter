Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  # 請依照專案指定規格來設定路由
  root"tweets#index"
  resources :tweets, only: [:index, :show, :create] do
      get :replies ,:to => "replies#index"
      post :replies ,:to => "replies#create"
  	member do
  		post :like
  		post :unlike
  	end
  end

  resources :users, only: [:edit, :update] do
  	member do
  		get :tweets
  		get :followings
  		get :followers
      get :likes
  	end
  end

  resources :followships, only: [:create, :destroy]

  namespace :admin do
    root"tweets#index"
  	resources :tweets, only: [:index, :destroy, :show] do
      member do
        post :delete_reply
      end
    end
  	resources :users, only: [:index, :destroy]
  end

end
