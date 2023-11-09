Rails.application.routes.draw do

  get 'homes/top'
  root to: 'homes#top'
  get "search" => "searches#search"
  get "category_search" => "searches#category_search"
  get 'homes/notes'


  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update] do
    delete 'comment_destroy/:comment_id', to: "customers#comment_destroy", as: :comment_destroy
  end
  end


  resources :posts,only: [:index,:create,:show,:edit,:destroy] do
    resources :comments, only: [:create, :destroy]
  end

  namespace :public do
    resources :posts,only: [:index,:create,:show,:edit,:destroy] do
      resource :bookmarks, only: [:create, :destroy]
    end

       resources :customers,only: [:update,:edit,:show] do
         get 'customers/confirm'
         patch 'customers/is_withdraw'
        member do
        get :bookmarks
      end
    end
  end


  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, controllers: {
  sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
