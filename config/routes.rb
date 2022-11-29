Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pathways, only: [:index, :show] do
    resources :bookmarks, only: [:create]
  end
  resources :user_skills, only: [:new, :create]

  get "/dashboard", to: "dashboards#dashboard"
  get "/assessment", to: "pages#assessment"
  get "/recommendations/add", to: "recommendations#add"
end
