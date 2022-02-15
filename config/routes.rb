Rails.application.routes.draw do
  root "recipes#index"
  resources :recipes do
    collection do
      get :top
    end
  end
end
