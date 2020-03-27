Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'authenticate', to: 'authentication#authenticate'

  resources :users do
    resources :diaries do
      resources :days do
        resources :food_days do
          resources :foods
        end
      end
    end
  end

  resources :diaries do
    resources :days do
      resources :food_days
    end
  end

  resources :users do
    resources :posts
  end

  resources :users do
    resources :followings_posts
    end

  resources :users do
    resources :followers
  end

  resources :users do
    resources :followings
  end

  resources :foods
end