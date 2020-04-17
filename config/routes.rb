Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :diaries do
      resources :days do
        resources :food_days do
          resources :foods
        end
      end
    end
  end

  resources :users do
    resources :diaries do
      resources :days do
        resources :sport_days do
          resources :sports
        end
      end
    end
  end

  resources :diaries do
    resources :days do
      resources :food_days
    end
  end

  resources :diaries do
    resources :days do
      resources :sport_days
    end
  end

  resources :users do
    resources :posts
  end

  resources :users do
    resources :researches
  end

  resources :users do
    resources :followings_lists
  end

  resources :users do
    resources :weights
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

  resources :sports

end