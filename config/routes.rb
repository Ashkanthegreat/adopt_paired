Rails.application.routes.draw do
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
  post '/shelters/:id/reviews', to: 'reviews#create'
  delete '/shelters/:id/:review_id', to: 'reviews#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
