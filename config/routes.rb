Rails.application.routes.draw do
  
  devise_for :users

  root 'admin/welcome#index'


  namespace :admin do
    root 'welcome#index'
    resources :work_groups do
      get :members_management, on: :member
      post :add_member, on: :member
      delete :destroy_member, on: :member
    end
    resources :tasks do
      get :tasks_management, on: :member
      post :adding_task, on: :member
      delete :destroy_task, on: :member
      patch :edit_task, on: :member
    end
    resources :datasets do
      get :users, on: :collection
    end
  end

  namespace :front do
    root 'greeting#index'
  end


end
