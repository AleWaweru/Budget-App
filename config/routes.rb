Rails.application.routes.draw do
  root 'static_pages#splash'
  devise_for :users

  # This should be a block within `devise_scope :user`
  devise_scope :user do
    get 'users/show', to: 'users#show', as: 'user_show'
  end

  resources :categories, only: [:index, :show, :new, :create]
  resources :transactions, only: [:index, :show, :new, :create]
end
