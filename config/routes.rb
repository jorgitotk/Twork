Rails.application.routes.draw do
  
  resources :file_tasks
  devise_for :users

  root 'admin/welcome#index'

  namespace :admin do
    root 'welcome#index'
    resources :general_view do
      get :view_tasks, on: :member
      delete :destroy_comment, on: :member
    end
    resources :work_groups do
      get :members_management, on: :member
      post :add_member, on: :member
      delete :destroy_member, on: :member
    end
    resources :tasks do
      resources :comments do
        delete :destroy_comment
      end
      delete :destroy_comment, on: :member
      get :tasks_management, on: :member
      post :adding_task, on: :member
      delete :destroy_task, on: :member
      patch :edit_task, on: :member
      post :add_member, on: :member
      delete :destroy_assigned_member, on: :member
      patch :update_status, on: :member
    end
    resources :datasets do
      get :users, on: :collection
      get :members, on: :collection
    end
  end

  namespace :front do
    root 'greeting#index'
    resources :tasks do
      delete :destroy_comment
    end
  end


end
