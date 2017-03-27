Rails.application.routes.draw do

  resources :file_tasks
  devise_for :users

  root 'front/greeting#index'

  namespace :admin do
    root 'welcome#index'
    resources :general_view do
      member do
        get :view_tasks
        delete :destroy_comment
      end
    end
    resources :work_groups do
      member do
        get :members_management
        post :add_member
        delete :destroy_member
      end
    end
    resources :tasks do
      resources :comments do
        delete :destroy_comment
      end
      member do
        get :tasks_management
        post :add_member
        post :adding_task
        patch :edit_task
        patch :update_status
        delete :destroy_comment
        delete :destroy_task
        delete :destroy_assigned_member
      end
    end
    resources :datasets do
      collection do
        get :users
        get :members
      end
    end
  end

  namespace :front do
    root 'greeting#index'
    resources :tasks do
      delete :destroy_comment
    end
    resources :work_groups do
      get :members_management, on: :member
    end
  end

end
