Rails.application.routes.draw do

  
  get 'classrooms/index'

  get 'classrooms/create'

  get 'classrooms/update'

  get 'classrooms/delete'

  get 'registries/index'

  get 'registries/new'

  get 'registries/create'

  get 'registries/edit'

  get 'registries/update'

  get 'teachers/index'

  get 'teachers/new'

  get 'teachers/create'

  get 'teachers/edit'

  get 'teachers/update'

  get 'articles/index'

  get 'articles/new'

  get 'articles/create'

  get 'articles/edit'

  get 'articles/update'

  devise_for :users
  
  authenticated :user do
    root 'proyector#index'
  end
  
  root 'home#index'
end
