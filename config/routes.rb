Rails.application.routes.draw do
 
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  authenticated :user do
    root 'proyector#index'
    get 'registries/history', to: 'registries#history', as: 'history_registry'
    resources :registries
    get 'articles/:id', to: 'articles#index'
    resources :articles
    get 'articles/this/:id', to: 'articles#modify', as: 'edit_maintenance'
    get 'teachers/:id', to: 'teachers#index'
    resources :teachers
    get 'departments/:id', to: 'departments#index'
    resources :departments
    resources :classrooms
  end
  
  root 'home#index'
end
