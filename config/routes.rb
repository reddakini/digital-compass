Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pathways, only: [:index, :show]
  resources :user_skills, only: [:new, :create]

  get "/dashboard", to: "dashboards#dashboard"
  get "/assessment", to: "pages#assessment"
  get "/recommendations/add", to: "recommendations#add"
end
