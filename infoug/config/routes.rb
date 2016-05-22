Rails.application.routes.draw do
 
  resources :groups
  resources :subjects
  resources :departments
  devise_for :users, :controllers => { registrations: 'registrations' }  
  resources :admin
  resources :manage_groups
  
  root 'static_pages#home'
  delete 'sign_out' => 'devise/sessions#destroy'
 # get 'users/edit', to: 'users#edit', as: :user_edit
  
  post 'users/edit', to: 'users#update'
  get 'users', to: 'users#show'
  get 'users/edit', to: 'users#edit'
  patch 'users/edit', to: 'users#update'
  post 'admin/save_user', to: 'admin#save_user'
  get 'admin/panel/admin_edit_user', to: 'admin#admin_edit_user'
  get 'manage_groups', to: 'manage_groups#index'
  get 'manage_post', to: 'manage_post#index'
  get 'manage_post/edit_post', to: 'manage_post#edit_post'
  post 'admin/panel/admin_edit_user/delete_department', to: 'admin#delete_department'
  post 'admin/panel/admin_edit_user/add_department', to: 'admin#add_department'
  post 'admin/panel/admin_edit_user/delete_subject', to: 'admin#delete_subject'
  post 'admin/panel/admin_edit_user/add_subject', to: 'admin#add_subject'
  post 'admin/panel/admin_edit_user/delete_group', to: 'admin#delete_group'
  post 'admin/panel/admin_edit_user/add_group', to: 'admin#add_group'
  
  post 'manage_groups/delete_department', to: 'manage_groups#delete_department'
  post 'manage_groups/add_department', to: 'manage_groups#add_department'
  post 'manage_groups/delete_subject', to: 'manage_groups#delete_subject'
  post 'manage_groups/add_subject', to: 'manage_groups#add_subject'
  post 'manage_groups/delete_group', to: 'manage_groups#delete_group'
  post 'manage_groups/add_group', to: 'manage_groups#add_group'
  
  post 'manage_post/add_post', to: 'manage_post#add_post'
  post 'manage_post/delete_post', to: 'manage_post#delete_post'
  post 'manage_post/edit_post', to: 'manage_post#edit_post'
  post 'manage_post/edit_post/update_post', to: 'manage_post#update_post'
  
  get 'red_button', to: 'admin#red_button'
  get 'turn_on_button', to: 'admin#turn_on_button'
  get 'turn_off_button', to: 'admin#turn_off_button'
  
  post 'static_pages/filter', to: 'static_pages#filter'
end
