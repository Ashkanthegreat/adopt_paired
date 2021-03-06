Rails.application.routes.draw do
  root 'welcome#index'

  get '/shelters', to: 'shelters#index'
  get 'shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'

  get '/shelters/:id/pets', to: 'shelters_pets#index'
  get '/shelters/:id/pets/new', to: 'shelters_pets#new'
  post '/shelters/:id/pets', to: 'shelters_pets#create'

  get '/shelters/:id/reviews/new', to: 'reviews#new'
  get '/shelters/:id/:review_id/edit', to: 'reviews#edit'
  patch '/shelters/:id/:review_id', to: 'reviews#update'
  post '/shelters/:id/reviews', to: 'reviews#create'
  delete '/shelters/:id/:review_id', to: 'reviews#destroy'

  get "/favorites", to: 'favorites#index'
  patch "/favorites/:pet_id", to: 'favorites#update'
  delete "/favorites/:pet_id", to: 'favorites#destroy'
  delete "/favorites", to: 'favorites#destroy_all'

  get "/applications/new", to: 'applications#new'
  post "/applications", to: 'applications#create'
  get '/applications/:id', to: 'applications#show'

  get '/pets/:pet_id/applicants', to: 'pet_applications#index'
  patch '/applications/:application_id/pets/:pet_id', to: 'pet_applications#update'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
