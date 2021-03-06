Rails.application.routes.draw do
  root to: 'top#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :top, only: [:new, :create]
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'before_logout'
    end
  end
  resources :items, only: [:index, :new, :create, :show, :edit, :update,:destroy] do
    collection do
      get 'saling_show'
      get 'saled_show'
      get 'children_category', defaults: { format: 'json' }
      post 'pay/:id'=>   'items#pay', as: 'pay'
      post 'pay', to: 'items#pay'
    end
    member do
      get 'before_buy'
    end


  end

  resources :cards, only: [:create, :show, :index, :new, :destroy] do
  end
  resources :addresses, only: [:new, :create, :edit, :update]

end