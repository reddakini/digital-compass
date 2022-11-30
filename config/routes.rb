Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pathways, only: [:index, :show] do
    resources :bookmarks, only: [:create]
  end
  resources :user_skills, only: [:new, :create]
  resources :user_values, only: [:new, :create]

  patch "/user_skills_level", to: "user_skills#update_level", as: :update_level
  get "/dashboard", to: "dashboards#dashboard"
  get "/assessment", to: "pages#assessment"
  get "/recommendations/create", to: "recommendations#create"
end
