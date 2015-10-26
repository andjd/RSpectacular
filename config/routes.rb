Rails.application.routes.draw do
  root "users#index"
  resources :users do
    resources :goals, only: :new
    resources :user_comments, only: :new
  end
  resource :session, only: [:new, :create, :destroy]
  resources :goals, except: [:new, :index] do
    resources :goal_comments, only: :new
  end
  resources :goal_comments, except: :new
  resources :user_comments, except: :new
end
