Rails.application.routes.draw do
    devise_for :users, :controllers => {:registrations => "user/registrations"}

    root to: 'pages#index'

    # Pages
    get '/donation', to: 'pages#donation', as: 'donation'
    post '/donation', to: 'pages#donation'
    get '/about', to: 'pages#about', as: 'about'
    get '/contact', to: 'pages#contact', as: 'contact'

    # Pets
    get '/pets', to: 'pets#index', as: 'pets'
    get '/pets/new', to: 'pets#new', as: 'new_pet'
    post '/pets', to: 'pets#create'
    get '/pets/user_pets', to: 'pets#show_user_pets', as: 'user_pets'
    get '/pets/:id', to: 'pets#show', as: 'pet'
    put '/pets/:id', to: 'pets#update'
    patch '/pets/:id', to: 'pets#update'
    delete '/pets/:id', to: 'pets#destroy', as: 'delete_pet'
    get '/pets/:id/edit', to: 'pets#edit', as: 'edit_pet'
    
    # Foster Requests
    # get '/pets/:id', to: 'pets#show', as: 'foster_requests'
    get '/pets/:id/new_foster_request', to: 'foster_requests#new', as: 'new_foster_request'
    post '/pets/:id/new_foster_request', to: 'foster_requests#create'
    get '/pets/:id/end_foster_request', to: 'foster_requests#end_fostering', as: 'end_foster_request'
    post '/pets/:id/end_foster_request', to: 'foster_requests#terminate'
    get '/pets/:id/foster_requests', to: 'foster_requests#show_per_pet', as: 'foster_requests_per_pet'
    get '/foster_requests', to: 'foster_requests#index', as: 'foster_requests'
    get '/foster_requests/:id', to: 'foster_requests#show', as: 'show_foster_request'
    put '/foster_requests/:id', to: 'foster_requests#approve'
    patch '/foster_requests/:id', to: 'foster_requests#approve', as: 'approve_foster_request'
end