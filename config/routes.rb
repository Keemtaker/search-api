Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :api do
    get "count/:query", to: "pages#count", defaults: { format: :json }
  # end
end
