Rails.application.routes.draw do

  devise_for :users
  
  authenticated :user do
    root 'proyector#index'
    get 'registries/history', to: 'registries#history', as: 'history_registry'
    resources :registries
    get 'articles/:id', to: 'articles#index'
    resources :articles
    get 'teachers/:id', to: 'teachers#index'
    resources :teachers
    get 'departments/:id', to: 'departments#index'
    resources :departments
    resources :classrooms
  end
  
  root 'home#index'
end
