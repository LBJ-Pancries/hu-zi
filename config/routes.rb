Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => {:omniauth_callbacks => "omniauth_callbacks"}

  namespace :admin do
    resources :products do
      member do
        patch :move_up
        patch :move_down
      end
    end
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
    resources :categories
    resources :jobs do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
      post :favorite
      post :unfavorite
    end
    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
        post :checkout
    end
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  resources :favorites
  resources :cart_items
  resources :jobs do
    resources :resumes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :account do
   resources :groups
   resources :posts
   resources :orders
 end

  resources :groups do
   member do
     post :join
     post :quit
   end
   resources :posts
 end

end
