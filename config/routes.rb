Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:index, :destroy]
  resources :projects, except: [:index]

  get '/', to: "welcome#home"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"
  patch '/projects/:id/support', to: "projects#support"
  get '/search', to: "welcome#home"
  get '/notes/:id', to: "users#notes", as: "note"
  patch '/notes/:id', to: "users#notes_save"
  
end
