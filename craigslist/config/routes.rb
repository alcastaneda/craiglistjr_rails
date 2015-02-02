Rails.application.routes.draw do
  # get '/' => "application#index"
  get '/articles/:id/success' => 'articles#success'
  get '/articles/:id/:key' => 'articles#edit'

  resources :articles, :categories
  root to: "categories#index"
end
