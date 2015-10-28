Rails.application.routes.draw do
  root "static_pages#home"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users, except: [:destroy, :create, :new]

  namespace :supervisors do
    root "dashboard#index"
    resources :users
    resources :courses do
      resource :course_subjects, only: [:edit, :update]
      resources :subjects, only: :show
    end
    resources :subjects
  end
end
