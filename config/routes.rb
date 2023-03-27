Rails.application.routes.draw do
  resources :heroes, only: [:index, :show]
  resources :powers, only: [:index, :show, :update] do
    post 'hero_powers', on: :collection
  end
end
