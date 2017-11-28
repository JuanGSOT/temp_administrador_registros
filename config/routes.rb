Rails.application.routes.draw do

  devise_for :users
  
  authenticated :user do
    root 'proyector#index'
    get 'registries/history', to: 'registries#history', as: 'history_registry'
    resources :registries
    
    resources :articles
    resources :teachers
    resources :departments
    resources :classrooms
  end
  
  root 'home#index'
end
