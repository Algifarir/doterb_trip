Rails.application.routes.draw do
  resources :events
  get "/menu", to: "menu#index"
  get "/menu_user", to: "menu#user"
  get "/menu_role", to: "menu#role"
  get "/admin_edit", to: "admin#edit_role"
  get "/menu_event", to: "menu#event"
  get "/menu_attendance/:id", to: "menu#attendance", as: 'menu_attendance'
  get "/invite/:event_id", to: 'menu#invite', as: 'invite'
  post '/attendances/:user_id/events/:event_id', to: 'menu#create_attendance', as: 'create_attendance'
  post '/attendances/:user_id/events/:event_id/absent', to: 'menu#create_absent', as: 'create_absent'
  post 'invite/:user_id', to: 'menu#send_invitation', as: 'send_invite'
  root "menu#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    delete '/logout', to: 'devise/sessions#destroy', as: 'logout'
  end
end
