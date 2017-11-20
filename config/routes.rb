Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  resources :events do
    resources :attending, shallow: true, only: [:create, :destroy]
  end

  resources :teams


  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
