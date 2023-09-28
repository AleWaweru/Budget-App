Rails.application.routes.draw do
  root 'static_pages#splash'
  devise_for :users
  resources :users, only: [:index, :show, :new, :create]
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :transactions, only: [:index, :show, :new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
