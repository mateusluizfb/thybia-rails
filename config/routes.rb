Rails.application.routes.draw do
  devise_scope :user do
    root to: "users#index"
  end

  devise_for :users

  resources :deaths
  resources :collected_coins
  resources :users

  resources :killed_monsters do
    collection do
      post 'kill/:monster_id', to: 'killed_monsters#kill'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
