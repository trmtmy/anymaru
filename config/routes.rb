Rails.application.routes.draw do
  get 'homes/top'
  root to: 'homes#top'
  get "search" => "searches#search"
  get 'homes/notes'

  resources :posts,only: [:index,:create,:new,:show,:edit,:update,:destroy] do
    resources :comments, only: [:create, :destroy]

  end
  namespace :public do
    resources :posts,only: [:index,:create,:new,:show,:edit,:update,:destroy] do
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
