Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :events do
    resources :attending, shallow: true, only: [:create, :destroy]
  end

  namespace :api, defaults: {format: :json} do
  namespace :v1 do
    resources :events
  end
end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
