Rails.application.routes.draw do
  # get '/' => "application#index"
  resources :articles, :categories
  root to: "categories#index"
end
