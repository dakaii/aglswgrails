Rails.application.routes.draw do

  post 'users/signin' => 'users#signin'
  post 'users/signup' => 'users#signup'

  get 'projects' => 'projects#index'
  post 'projects' => 'projects#create'

  post 'projects/:project_id/contents' => 'contents#create'
  get 'projects/:project_id/contents' => 'contents#show'
  patch 'contents/:content_id' => 'contents#update'
  delete 'contents/:content_id' => 'contents#destroy'
end
