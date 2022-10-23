Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    get '/customers/mypage' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/conformation' => 'customers#conformation'
    patch '/customers' => 'customers#update_without'

    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]


    resources :items, only: [:index, :show]

    resources :addresses, only: [:index, :edit, :update, :create, :destroy]

    get '/orders/thanks' => 'orders#thanks'
    post '/orders/confirmation' => 'orders#confirmation'
    resources :orders, only: [:new, :create, :index, :show]
  end

  get '/admin' => 'admin/homes#top'

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :ordering_products, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
