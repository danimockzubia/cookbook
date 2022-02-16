Rails.application.routes.draw do
  devise_for :users
  root "recipes#index"
  resources :recipes do
    collection do
      get :top
    end
  end
end
