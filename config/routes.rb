Rails.application.routes.draw do

  devise_for :users
  resources :books do
    collection do
      get 'search'
    end
    resources :reviews
  end

  resources :users
  resources :authors do
  collection do
    get 'search'
  end
  end
  resources :publishers do
    collection do
      get 'search'
    end
  end

  resources :ages

  root 'books#index'
end
