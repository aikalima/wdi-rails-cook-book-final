CookBook::Application.routes.draw do
  resources :books, :recipes, :ingredients, :users, :sessions, :comments

  get '/signup' => 'users#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  get'/signin' => 'sessions#new'

  root to: 'books#index'

  get '/data.json' => 'stats#data'
  get '/stats' => 'stats#stats'

  get '/forgot' => 'users#forgot_password'
  post '/send_reset' => 'users#send_reset'
  get '/reset/:token' => 'users#reset_password'
  get '/comments/:book_id' => 'comments#new'

end

