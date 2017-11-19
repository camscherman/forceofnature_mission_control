Rails.application.routes.draw do
  devise_for :users
  resources :events do
    resources :attending, shallow: true, only: [:create, :destroy]
  end


  root to: "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
