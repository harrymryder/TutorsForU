Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :edit, :update] do
    resources :user_subjects, only: [:new, :create, :destroy]
    resources :meetings, only: [:index, :new, :create]
  end
  resources :pages, only: [:home, :show]
  root to: 'pages#home'
end
