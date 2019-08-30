Rails.application.routes.draw do
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  devise_for :users
  resources :monsters do
    post :kill
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
