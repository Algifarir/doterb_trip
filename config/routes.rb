Rails.application.routes.draw do
  get "/menu", to: "menu#index"
  root "menu#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
end
